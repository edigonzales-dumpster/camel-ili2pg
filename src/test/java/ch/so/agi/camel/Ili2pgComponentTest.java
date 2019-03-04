package ch.so.agi.camel;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.mock.MockEndpoint;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.junit.Test;

public class Ili2pgComponentTest extends CamelTestSupport {

    @Test
    public void testIli2pg() throws Exception {
        MockEndpoint mock = getMockEndpoint("mock:result");
        mock.expectedMinimumMessageCount(1);       
        mock.expectedBodiesReceived(9);

        template.sendBody("direct:ili2pg", 3);

        assertMockEndpointsSatisfied();
    }

    @Override
    protected RouteBuilder createRouteBuilder() throws Exception {
        return new RouteBuilder() {
            public void configure() {
                from("direct:ili2pg")
                .to("ili2pg://bar")
                .to("mock:result");
            }
        };
    }
}
