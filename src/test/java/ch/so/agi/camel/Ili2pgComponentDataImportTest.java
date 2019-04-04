package ch.so.agi.camel;

import java.io.File;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.camel.Exchange;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.mock.MockEndpoint;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.junit.ClassRule;
import org.junit.Test;
import org.testcontainers.containers.PostgisContainerProvider;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.containers.wait.strategy.Wait;

import ch.so.agi.camel.util.TestUtilSql;

public class Ili2pgComponentDataImportTest extends CamelTestSupport {
    static String WAIT_PATTERN = ".*database system is ready to accept connections.*\\s";
    
    private static String dbusr = "ddluser";
    private static String dbpwd = "ddluser";
    private static String dbdatabase = "edit";
    private static String dbschema = "test_dataimport";
    
    @ClassRule
    public static PostgreSQLContainer postgres = 
        (PostgreSQLContainer) new PostgisContainerProvider()
        .newInstance().withDatabaseName("edit")
        .withUsername(dbusr).withPassword(dbpwd)
        .withInitScript("init_postgresql.sql")
        .waitingFor(Wait.forLogMessage(WAIT_PATTERN, 2));

    @Test
    public void testIli2pg() throws Exception {
        // Prepare database: create schema and tables
        // Executing these queries in the testcontainer init script method is very slow (100s)!?
        File sqlFile = new File("src/test/resources/importTest/create_schema_gb2av.sql");
        String sqlFileContent = new String(Files.readAllBytes(sqlFile.toPath()));
        
        Connection con = TestUtilSql.connectPG(postgres);
        Statement s1 = con.createStatement();
        boolean ret = s1.execute(sqlFileContent);
        con.commit();
        TestUtilSql.closeCon(con);

        // run test
        template.sendBody("direct:ili2pg", new File("src/test/data/VOLLZUG_SO0200002401_1531_20180105113131.xml"));

        MockEndpoint resultEndpoint = getMockEndpoint("mock:result");
        resultEndpoint.expectedMinimumMessageCount(1);  
        
        Exchange exchange = resultEndpoint.getExchanges().get(0);
        String resultFileContent = exchange.getIn().getBody(String.class);
        
        assertTrue(resultFileContent.contains("Info: VOLLZUG_SO0200002401_1531_20180105113131.xml: GB2AV.Vollzugsgegenstaende BID=C1D314519B9042E991E8B5F64F6B7FA9"));
        assertTrue(resultFileContent.contains("Info:       1 objects in CLASS GB2AV.MutationsNummer"));
        assertTrue(resultFileContent.contains("Info:       1 objects in CLASS GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand"));
        assertTrue(resultFileContent.contains("Info: ...import done"));
        
        assertMockEndpointsSatisfied();
                
        // Check schema and table creation.
        con = TestUtilSql.connectPG(postgres);
        Statement s2 = con.createStatement();
        ResultSet rs2 = s2.executeQuery("SELECT t_datasetname, tagebuchbeleg FROM " + dbschema + ".vollzugsgegnstnde_vollzugsgegenstand");
        
        if(!rs2.next()) {
            fail();
        }

        assertTrue(rs2.getString(1).equals("VOLLZUG_SO0200002401_1531_20180105113131"));
        assertTrue(rs2.getString(2).equals("006-2017/2145/0"));
        
        if(rs2.next()) {
            fail();
        }
        
        TestUtilSql.closeCon(con);
    }

    @Override
    protected RouteBuilder createRouteBuilder() throws Exception {
        return new RouteBuilder() {
            public void configure() throws InterruptedException {                
                String dburl = postgres.getJdbcUrl();
                String[] parts = dburl.split(":");
                String dbhost = parts[2].substring(2);
                String dbport = parts[3].substring(0, parts[3].indexOf("/"));
                
                from("direct:ili2pg")
                .to("ili2pg:import?dbhost="+dbhost+"&dbport="+dbport+"&dbdatabase="+dbdatabase+"&dbschema="+dbschema+"&dbusr="+dbusr+"&dbpwd="+dbpwd+"&models=GB2AV&dataset=VOLLZUG_SO0200002401_1531_20180105113131")
                .to("mock:result");
            }
        };
    }
}
