package ch.so.agi.camel;

import org.apache.camel.Exchange;
import org.apache.camel.Message;
import org.apache.camel.impl.DefaultProducer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The Ili2pg producer.
 */
public class Ili2pgProducer extends DefaultProducer {
    private static final Logger LOG = LoggerFactory.getLogger(Ili2pgProducer.class);
    private Ili2pgEndpoint endpoint;

    public Ili2pgProducer(Ili2pgEndpoint endpoint) {
        super(endpoint);
        this.endpoint = endpoint;
    }

    public void process(Exchange exchange) throws Exception {
        System.out.println(exchange.getIn().getBody());    
        
       
        LOG.info("*******************3");
        LOG.info(endpoint.getDbhost());
        
        LOG.debug("Getting value from exchange");
        //Integer value = exchange.getIn().getBody(Integer.class);
        
        int value = 3;
        LOG.debug("Computing square");
        Integer square = value * value;
        LOG.info("The square is " + square);
        if (exchange.getPattern().isOutCapable()) {
            Message out = exchange.getOut();
            out.copyFrom(exchange.getIn());
            out.setBody(square);
        } else {
            Message in = exchange.getIn();
            in.setBody(square);
        }

    }

}
