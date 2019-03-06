package ch.so.agi.camel;

import org.apache.camel.Consumer;
import org.apache.camel.Processor;
import org.apache.camel.Producer;
import org.apache.camel.impl.DefaultEndpoint;
import org.apache.camel.spi.Metadata;
import org.apache.camel.spi.UriEndpoint;
import org.apache.camel.spi.UriParam;
import org.apache.camel.spi.UriPath;

/**
 * Represents a Ili2pg endpoint.
 */
@UriEndpoint(firstVersion = "0.0.1-SNAPSHOT", scheme = "ili2pg", title = "Ili2pg", syntax="ili2pg:name", label = "custom")
public class Ili2pgEndpoint extends DefaultEndpoint {
    @UriPath @Metadata(required = "true")
    private String name;
    
    @UriParam(defaultValue = "10")
    private int option = 10;

    @UriParam
    private boolean disableValidation = true; 
    
    @UriParam(defaultValue = "localhost")
    private String dbhost = "localhost";
    
    @UriParam @Metadata(required = "true")
    private String dbschema;
    
    
    public Ili2pgEndpoint() {
    }

    public Ili2pgEndpoint(String uri, Ili2pgComponent component) {
        super(uri, component);
    }

    public Ili2pgEndpoint(String endpointUri) {
        super(endpointUri);
    }

    public Producer createProducer() throws Exception {
        return new Ili2pgProducer(this);
    }

    public Consumer createConsumer(Processor processor) throws Exception {
        throw new UnsupportedOperationException("The Ili2pg endpoint doesn't support consumers.");
    }

    public boolean isSingleton() {
        return true;
    }

    /**
     * Some description of this option, and what it does
     */
    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    /**
     * Some description of this option, and what it does
     */
    public void setOption(int option) {
        this.option = option;
    }

    public int getOption() {
        return option;
    }
    
    /**
     * Schaltet die Validierung aus.
     */
    public void setDisableValidation(boolean disableValidation) {
        this.disableValidation = disableValidation;
    }
    
    public boolean getDisableValidation() {
        return this.disableValidation;
    }
    
    /**
     * Der hostname der Datenbank.
     */
    public String getDbhost() {
        return dbhost;
    }

    public void setDbhost(String dbhost) {
        this.dbhost = dbhost;
    }

    /**
     * Definiert den Namen des Datenbank-Schemas.
     */
    public String getDbschema() {
        return dbschema;
    }

    public void setDbschema(String dbschema) {
        this.dbschema = dbschema;
    }
}
