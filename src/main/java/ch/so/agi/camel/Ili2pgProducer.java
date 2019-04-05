package ch.so.agi.camel;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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

    private final String ILI2PG_HEADER_NAME = "ili2pg";
    
    public Ili2pgProducer(Ili2pgEndpoint endpoint) {
        super(endpoint);
        this.endpoint = endpoint;
    }

    public void process(Exchange exchange) throws Exception {
        File xtfFile = exchange.getIn().getBody(File.class);

        Config settings = createConfig();
       
        if (endpoint.getOperation().equalsIgnoreCase("import")) {
            settings.setFunction(Config.FC_IMPORT);
        } else if (endpoint.getOperation().equalsIgnoreCase("schemaimport")) {
            settings.setFunction(Config.FC_SCHEMAIMPORT);
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
            settings.setValidation(false);
        }
        if (endpoint.getDataset() != null) {
            settings.setDatasetName(endpoint.getDataset());
        }
        if (endpoint.getModels() != null) {
            settings.setModels(endpoint.getModels());
        }
        
        if (Ili2db.isItfFilename(xtfFile.getAbsolutePath())) {
            settings.setItfTransferfile(true);
        }
        settings.setXtffile(xtfFile.getAbsolutePath());
          
        // Different approach can be a directory that can be set with parameter.
        // But we want to keep the xtf as message body.
//        Path tempDir = Files.createTempDirectory("ili2pg_camel_");        
//        File logFile = Paths.get(tempDir.toFile().getAbsolutePath(), xtfFilename.getName() + ".log").toFile();
//        settings.setLogfile(logFile.getAbsolutePath());
        
        try {
            Ili2db.readSettingsFromDb(settings);
            Ili2db.run(settings, null);
            
            if (exchange.getPattern().isOutCapable()) {
                Message out = exchange.getOut();
                out.copyFrom(exchange.getIn());
                out.setBody(xtfFile);
                out.setHeader(ILI2PG_HEADER_NAME, true);
            } else {
                Message in = exchange.getIn();
                in.setBody(xtfFile);
                in.setHeader(ILI2PG_HEADER_NAME, true);
            }
        } catch (Exception e) {
            // TODO: better distinguish if it is a ili2pg error?
            
            log.error("failed to run ili2pg", e);
            log.error(e.getMessage());

            // do not throw error but set the header accordingly.
//            throw new Exception(e);
            
            if (exchange.getPattern().isOutCapable()) {
                Message out = exchange.getOut();
                out.copyFrom(exchange.getIn());
                out.setBody(xtfFile);
                out.setHeader(ILI2PG_HEADER_NAME, false);
            } else {
                Message in = exchange.getIn();
                in.setBody(xtfFile);
                in.setHeader(ILI2PG_HEADER_NAME, false);                
            }
        }
    }

    private Config createConfig() {
        Config settings = new Config();
        new PgMain().initConfig(settings);
        return settings;
    }
}
