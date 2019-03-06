package ch.so.agi.camel;

import java.util.Map;

import org.apache.camel.CamelContext;
import org.apache.camel.Endpoint;

import org.apache.camel.impl.DefaultComponent;

/**
 * Represents the component that manages {@link Ili2pgEndpoint}.
 */
public class Ili2pgComponent extends DefaultComponent {    
    protected Endpoint createEndpoint(String uri, String remaining, Map<String, Object> parameters) throws Exception {       
        Ili2pgEndpoint endpoint = new Ili2pgEndpoint(uri, this);
        endpoint.setOperation(remaining);
        setProperties(endpoint, parameters);
        return endpoint;
    }
}
