package ch.so.agi.camel;

import java.io.File;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.mock.MockEndpoint;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.junit.ClassRule;
import org.junit.Test;
import org.testcontainers.containers.PostgisContainerProvider;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.containers.wait.strategy.Wait;

public class Ili2pgComponentTest extends CamelTestSupport {
    static String WAIT_PATTERN = ".*database system is ready to accept connections.*\\s";
    
    private static String dbusr = "ddluser";
    private static String dbpwd = "ddluser";
    private static String dbdatabase = "edit";
    
    @ClassRule
    public static PostgreSQLContainer postgres = 
        (PostgreSQLContainer) new PostgisContainerProvider()
        .newInstance().withDatabaseName("edit")
        .withUsername(dbusr).withPassword(dbpwd)
        .withInitScript("init_postgresql.sql")
        .waitingFor(Wait.forLogMessage(WAIT_PATTERN, 2));

    @Test
    public void testIli2pg() throws Exception {
        // TODO:
        // - Understand Apache Camel testing.
        
        MockEndpoint mock = getMockEndpoint("mock:result");
        mock.expectedMinimumMessageCount(1);       
        mock.expectedBodiesReceived(9);

        template.sendBody("direct:ili2pg", new File("src/test/data/VOLLZUG_SO0200002401_1531_20180105113131.xml"));

        assertMockEndpointsSatisfied();
        
        // TODO: some select from ... to check if import is ok.
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
                .to("ili2pg:import?dbhost="+dbhost+"&dbport="+dbport+"&dbdatabase="+dbdatabase+"&dbschema=test_import&dbusr="+dbusr+"&dbpwd="+dbpwd)
                .to("mock:result");
            }
        };
    }
}
