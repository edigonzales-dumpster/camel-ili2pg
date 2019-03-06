package ch.so.agi.camel;

import java.io.File;

import org.apache.camel.Exchange;
import org.apache.camel.Message;
import org.apache.camel.impl.DefaultProducer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.ehi.ili2db.base.Ili2db;
import ch.ehi.ili2db.gui.Config;
import ch.ehi.ili2pg.PgMain;
import ch.ehi.basics.settings.Settings;

//import ch.ehi.

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
//        System.out.println(exchange.getIn().getBody());    
        Object body = exchange.getIn().getBody();
        LOG.info(body.getClass().toString());
        LOG.info(body.toString());
        LOG.info("***********************");

        File xtfFilename = exchange.getIn().getBody(File.class);
        LOG.info("**0");
        LOG.info(xtfFilename.getAbsolutePath());

        LOG.info("**1");
        Config settings = createConfig();
        LOG.info("**2");

        LOG.info(endpoint.getOperation());
        
        
        // TODO: throws error while testing?!
        if (endpoint.getOperation().equalsIgnoreCase("import")) {
            settings.setFunction(Config.FC_IMPORT);
        }
//        settings.setFunction(Config.FC_IMPORT);
        LOG.info("**3");

//        settings.setDbhost(endpoint.getDbhost());
//        settings.setDbport(endpoint.getDbport());
//        settings.setDbdatabase(endpoint.getDbdatabase());
//        settings.setDbschema(endpoint.getDbschema()); 
//        settings.setDbusr(endpoint.getDbusr());
//        settings.setDbpwd(endpoint.getDbpwd());
        settings.setDbhost("192.168.50.8");
        settings.setDbport("5432");
        settings.setDbdatabase("pub");
        settings.setDbschema("agi_fubar");
        settings.setDbusr("ddluser");
        settings.setDbpwd("ddluser");

        String dburl = "jdbc:postgresql://" + settings.getDbhost() + ":" + settings.getDbport() + "/"
                + settings.getDbdatabase();
        settings.setDburl(dburl);

        if (endpoint.isNameByTopic()) {
            settings.setNameOptimization(settings.NAME_OPTIMIZATION_TOPIC);
        }
        if (endpoint.getDisableValidation()) {
            settings.setValidation(endpoint.getDisableValidation());
        }

        if (Ili2db.isItfFilename(xtfFilename.getAbsolutePath())) {
            settings.setItfTransferfile(true);
        }
        settings.setXtffile(xtfFilename.getAbsolutePath());

        Ili2db.readSettingsFromDb(settings);
//        Ili2db.run(settings, null);

        LOG.info("*******************3");
        LOG.info(endpoint.getDbhost());

//        Object body = exchange.getIn().getBody();
//        LOG.info(body.getClass().toString());

//        File transferFile = exchange.getIn().getBody(File.class);
//        LOG.info(transferFile.getAbsolutePath());

        LOG.debug("Getting value from exchange");
        // Integer value = exchange.getIn().getBody(Integer.class);

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

    private Config createConfig() {
        Config settings = new Config();
        new PgMain().initConfig(settings);
        return settings;
    }

}
