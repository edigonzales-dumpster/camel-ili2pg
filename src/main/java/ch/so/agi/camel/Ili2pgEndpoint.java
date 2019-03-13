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
@UriEndpoint(firstVersion = "0.0.1-SNAPSHOT", scheme = "ili2pg", title = "Ili2pg", syntax="ili2pg:operation", label = "Interlis")
public class Ili2pgEndpoint extends DefaultEndpoint {
    @UriPath @Metadata(required = "true")
    private String operation;
    
    @UriParam(defaultValue = "10")
    private int option = 10;
    
    @UriParam(defaultValue = "localhost")
    private String dbhost = "localhost";
        
    @UriParam(defaultValue = "5432")
    private String dbport;

    @UriParam @Metadata(required = "true")
    private String dbdatabase;

    @UriParam @Metadata(required = "true")
    private String dbschema;

    @UriParam @Metadata(required = "true")
    private String dbusr;

    @UriParam @Metadata(required = "true")
    private String dbpwd;
    
    @UriParam(defaultValue = "true")
    private boolean nameByTopic = true; 

    @UriParam(defaultValue = "true")
    private boolean strokeArcs = true; 

    @UriParam(defaultValue = "true")
    private boolean disableValidation = true; 
    
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
     * Die Port-Nummer, unter der die Datenbank angesprochen warden kann. Default ist 5432.
     */
    public String getDbport() {
        return dbport;
    }

    public void setDbport(String dbport) {
        this.dbport = dbport;
    }
    
    /**
     * Der Name der Datenbank.
     */
    public String getDbdatabase() {
        return dbdatabase;
    }

    public void setDbdatabase(String dbdatabase) {
        this.dbdatabase = dbdatabase;
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
    
    /**
     * Der Benutzername für den Datenbankzugang und Einträge in Metatabellen.
     */
    public String getDbusr() {
        return dbusr;
    }

    public void setDbusr(String dbusr) {
        this.dbusr = dbusr;
    }

    /**
     * Das Passwort für den Datenbankzugriff.
     */
    public String getDbpwd() {
        return dbpwd;
    }

    public void setDbpwd(String dbpwd) {
        this.dbpwd = dbpwd;
    }

    /**
     * Für alle Tabellennamen werden teilweise qualifizierte Interlis-Klassennamen (Topic.Class) verwendet 
     * (und in einen gültigen Tabellennamen abgebildet).
     */
    public boolean isNameByTopic() {
        return nameByTopic;
    }

    public void setNameByTopic(boolean nameByTopic) {
        this.nameByTopic = nameByTopic;
    }

    /**
     * Segmentiert Kreisbogen beim Datenimport. Der Radius geht somit verloren. Die Kreisbogen werden so segmentiert, 
     * dass die Abweichung der erzeugten Geraden kleiner als die Koordinatengenauigkeit der Stützpunkte ist.
     */
    public boolean isStrokeArcs() {
        return strokeArcs;
    }

    public void setStrokeArcs(boolean strokeArcs) {
        this.strokeArcs = strokeArcs;
    }

    /**
     * Ili2pg-Operation: import/update/replace/delete/export. Default ist import.
     */
    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }
}
