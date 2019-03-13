package ch.so.agi.camel;

import java.io.File;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.mock.MockEndpoint;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.junit.Test;

public class Ili2pgComponentTest extends CamelTestSupport {

    @Test
    public void testIli2pg() throws Exception {
        // TODO:
        // - Understand Apache Camel testing.
        // - Guess I need a running DB.
        
        MockEndpoint mock = getMockEndpoint("mock:result");
        mock.expectedMinimumMessageCount(1);       
        mock.expectedBodiesReceived(9);

        template.sendBody("direct:ili2pg", new File("src/test/data/VOLLZUG_SO0200002401_1531_20180105113131.xml"));

        assertMockEndpointsSatisfied();
    }

    @Override
    protected RouteBuilder createRouteBuilder() throws Exception {
        return new RouteBuilder() {
            public void configure() {
                from("direct:ili2pg")
                .to("ili2pg:import?dbhost=192.168.50.8&dbport=5432&dbdatabase=pub&dbschema=agi_gb2av&dbusr=ddluser&dbpwd=ddluser")
                .to("mock:result");
            }
        };
    }
}
