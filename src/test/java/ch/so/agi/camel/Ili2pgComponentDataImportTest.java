package ch.so.agi.camel;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
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
        // Executing these queries in the testcontainer init script is very slow (100s)!?
        File sqlFile = new File("src/test/resources/importTest/create_schema_gb2av.sql");
        String fileContent = new String(Files.readAllBytes(sqlFile.toPath()));
        
        Connection con = TestUtilSql.connectPG(postgres);
        Statement s = con.createStatement();
        boolean ret = s.execute(fileContent);
        con.commit();
        
        // run test
        template.sendBody("direct:ili2pg", new File("src/test/data/VOLLZUG_SO0200002401_1531_20180105113131.xml"));

        MockEndpoint resultEndpoint = getMockEndpoint("mock:result");
        resultEndpoint.expectedMinimumMessageCount(1);  
        
//        Exchange exchange = resultEndpoint.getExchanges().get(0);
//        String fileContent = exchange.getIn().getBody(String.class);
//        
//        assertTrue(fileContent.contains("Info: create table structure, if not existing..."));
//        assertTrue(fileContent.contains("Info: ...done"));
        
        assertMockEndpointsSatisfied();
        
//        Info: VOLLZUG_SO0200002401_1531_20180105113131.xml: GB2AV.Vollzugsgegenstaende BID=C1D314519B9042E991E8B5F64F6B7FA9
//                Info:       1 objects in CLASS GB2AV.MutationsNummer
//                Info:       1 objects in CLASS GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand
//                Info: ...import done
        
        // Check schema / table creation.
//        Connection con = TestUtilSql.connectPG(postgres);
//        Statement s = con.createStatement();
//        ResultSet rs = s.executeQuery("SELECT content FROM " + dbschema + ".t_ili2db_model");
//        
//        if(!rs.next()) {
//            fail();
//        }
//
//        assertTrue(rs.getString(1).contains("INTERLIS 2.2;"));
//        
//        if(rs.next()) {
//            fail();
//        }
//        
//        TestUtilSql.closeCon(con);
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
