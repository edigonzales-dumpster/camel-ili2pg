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

/**
 * The Ili2pg producer.
 */
public class Ili2pgProducer extends DefaultProducer {
    private static final Logger log = LoggerFactory.getLogger(Ili2pgProducer.class);
    private Ili2pgEndpoint endpoint;

    public Ili2pgProducer(Ili2pgEndpoint endpoint) {
        super(endpoint);
        this.endpoint = endpoint;
    }

    public void process(Exchange exchange) throws Exception {
//        Object body = exchange.getIn().getBody();
//        log.info(body.getClass().toString());
//        log.info(body.toString());
//        log.info("***********************");

        File xtfFilename = exchange.getIn().getBody(File.class);

        Config settings = createConfig();
       
        if (endpoint.getOperation().equalsIgnoreCase("import")) {
            settings.setFunction(Config.FC_IMPORT);
        }

        settings.setDbhost(endpoint.getDbhost());
        settings.setDbport(endpoint.getDbport());
        settings.setDbdatabase(endpoint.getDbdatabase());
        settings.setDbschema(endpoint.getDbschema()); 
        settings.setDbusr(endpoint.getDbusr());
        settings.setDbpwd(endpoint.getDbpwd());


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

        try {
            Ili2db.readSettingsFromDb(settings);
//            Ili2db.run(settings, null);

          int value = 3;
          Integer square = value * value;
          log.info("The square is " + square);

          if (exchange.getPattern().isOutCapable()) {
              Message out = exchange.getOut();
              out.copyFrom(exchange.getIn());
              out.setBody(square);
          } else {
              Message in = exchange.getIn();
              in.setBody(square);
          }
        } catch (Exception e) {
            log.error("failed to run ili2pg", e);
            log.error(e.getMessage());
            
            throw new Exception(e);
        }
    }

    private Config createConfig() {
        Config settings = new Config();
        new PgMain().initConfig(settings);
        return settings;
    }

}
