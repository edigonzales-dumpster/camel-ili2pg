CREATE SCHEMA IF NOT EXISTS test_dataimport;
CREATE SEQUENCE test_dataimport.t_ili2db_seq;;
-- GB2AV.Flurname
CREATE TABLE test_dataimport.flurname (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,aname varchar(40) NOT NULL
  ,grundstcsbsb_grndsteck_flurnamen bigint NULL
)
;
CREATE INDEX flurname_t_basket_idx ON test_dataimport.flurname ( t_basket );
CREATE INDEX flurname_t_datasetname_idx ON test_dataimport.flurname ( t_datasetname );
CREATE INDEX flurname_grundstcsbsb_dstck_flrnmen_idx ON test_dataimport.flurname ( grundstcsbsb_grndsteck_flurnamen );
COMMENT ON TABLE test_dataimport.flurname IS 'Angaben zur Flur.';
COMMENT ON COLUMN test_dataimport.flurname.aname IS 'Name der Flur.
DM01: Nomenklatur.Flurname->Name';
COMMENT ON COLUMN test_dataimport.flurname.grundstcsbsb_grndsteck_flurnamen IS 'Die zutreffenden Flurnamen.
DM01: muss berechnet werden, durch Schnitt mit Nomenklatur.Flurname';
-- GB2AV.Gemeinde
CREATE TABLE test_dataimport.gemeinde (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,aname varchar(30) NOT NULL
  ,bfsnr integer NOT NULL
  ,grundstcsbsb_grndsteck_gemeinde bigint NULL
)
;
CREATE INDEX gemeinde_t_basket_idx ON test_dataimport.gemeinde ( t_basket );
CREATE INDEX gemeinde_t_datasetname_idx ON test_dataimport.gemeinde ( t_datasetname );
CREATE INDEX gemeinde_grundstcsbsb_rndstck_gmnde_idx ON test_dataimport.gemeinde ( grundstcsbsb_grndsteck_gemeinde );
-- GB2AV.GrundstueckNummer
CREATE TABLE test_dataimport.grundstuecknummer (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,egrid varchar(14) NULL
  ,nummer varchar(12) NOT NULL
  ,nummerzusatz varchar(12) NULL
  ,amt varchar(3) NULL
  ,subkreis varchar(15) NULL
  ,los varchar(15) NULL
  ,eigntmsvrhls_grndsteck_nummer bigint NULL
  ,grundstcsbsb_grndsteck_nummer bigint NULL
  ,mutationstbll_bschnitt_von bigint NULL
  ,mutationstabll_vmttion_geloeschtegrundstuecke bigint NULL
)
;
CREATE INDEX grundstuecknummer_t_basket_idx ON test_dataimport.grundstuecknummer ( t_basket );
CREATE INDEX grundstuecknummer_t_datasetname_idx ON test_dataimport.grundstuecknummer ( t_datasetname );
CREATE INDEX grundstuecknummer_eigntmsvrhls_rndstck_nmmer_idx ON test_dataimport.grundstuecknummer ( eigntmsvrhls_grndsteck_nummer );
CREATE INDEX grundstuecknummer_grundstcsbsb_rndstck_nmmer_idx ON test_dataimport.grundstuecknummer ( grundstcsbsb_grndsteck_nummer );
CREATE INDEX grundstuecknummer_mutationstbll_bschnitt_von_idx ON test_dataimport.grundstuecknummer ( mutationstbll_bschnitt_von );
CREATE INDEX grundstuecknummer_muttnstbll_vmschtgrndstcke_idx ON test_dataimport.grundstuecknummer ( mutationstabll_vmttion_geloeschtegrundstuecke );
COMMENT ON TABLE test_dataimport.grundstuecknummer IS 'Schweiz-weite, eindeutge Kennung eines Grundstücks.
Die Nummerierung ist 5-stufig. (Amt, SubKreis, Los, Nummer, NummerZusatz). SubKreis, Los und NummerZusatz sind optional.';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.egrid IS 'Die(neue) schweizweit eindeutige Nummer eines Grundstückes. Das Nummerierungsschema muss noch durch das  Eidg. Grundbuchamt festgelegt werden.';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.nummer IS 'Die Nummer des Grundstücks, ohne Angabe des Grundbuchamtes,  Subkreises oder Loses.
DM01: Liegenschaften. Grundstueck->Nummer';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.nummerzusatz IS 'BE: Nummer des Teilgrundstücks. FR; Index des Grundstücks (Schlüsselfeld im Fall MCA, plans graphiques provisoires et registre foncier cantonal)
DM01: Liegenschaften.Liegenschaft->NummerTeilGrundstueck';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.amt IS 'Die Nummer des Grundbuchamtes. Die Nummer eines Grundbuchamtes wird durch das Eidg. Grundbuchamt festgelegt.
Ab KS3-20050901 nicht mehr verwenden!';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.subkreis IS 'Die Nummer des Sub-Kreises innerhalb eines Grundbuchamtes. Die Unterteilung in Sub-Kreise und deren Nummerierung erfolgt durch das entsprechende Grundbuchamt bzw. den Kanton.';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.los IS 'Die Nummer des Loses innerhalb eines Subkreises. Die Unterteilung in Lose und deren Nummerierung erfolgt durch das entsprechende Grundbuchamt bzw. den Kanton.';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.eigntmsvrhls_grndsteck_nummer IS 'Die Grundstücksnummer,
z.B. eine Liegenschaftennummer oder Wegrechtnummer.';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.grundstcsbsb_grndsteck_nummer IS 'Die Grundstücksnummer der Liegenschaft.';
COMMENT ON COLUMN test_dataimport.grundstuecknummer.mutationstbll_bschnitt_von IS 'Liegenschaft, von der die Fläche abgetrennt wird.';
-- GB2AV.GBPlan
CREATE TABLE test_dataimport.gbplan (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,nummer varchar(12) NOT NULL
  ,nbident varchar(12) NOT NULL
  ,grundstcsbsb_grndsteck_gbplaene bigint NULL
)
;
CREATE INDEX gbplan_t_basket_idx ON test_dataimport.gbplan ( t_basket );
CREATE INDEX gbplan_t_datasetname_idx ON test_dataimport.gbplan ( t_datasetname );
CREATE INDEX gbplan_grundstcsbsb_dstck_gbplene_idx ON test_dataimport.gbplan ( grundstcsbsb_grndsteck_gbplaene );
COMMENT ON TABLE test_dataimport.gbplan IS 'Angaben zum Grundbuchplan';
COMMENT ON COLUMN test_dataimport.gbplan.nummer IS 'Die Nummer des Grundbuchplans.
DM01: Planeinteilung.Plan->Nummer';
COMMENT ON COLUMN test_dataimport.gbplan.nbident IS 'Der Nummerierungsbereich, indem die Nummer eindeutig ist.
DM01: Planeinteilung.Plan->NBIdent';
COMMENT ON COLUMN test_dataimport.gbplan.grundstcsbsb_grndsteck_gbplaene IS 'Die Grundbuchpläne auf der die Liegenschaft liegt.
DM01: muss berechnet werden, durch Schnitt mit dem Thema Planeinteilung.';
-- GB2AV.GebaeudeeingangAdresse
CREATE TABLE test_dataimport.gebaeudeeingangadresse (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,strasse varchar(60) NULL
  ,hausnummer varchar(12) NULL
  ,gebaeudebezeichnung varchar(60) NULL
  ,benanntesgebiet varchar(60) NULL
  ,plz integer NOT NULL
  ,plzzusatzziffern integer NULL
  ,ortschaft varchar(40) NOT NULL
  ,gwr_egid integer NULL
  ,gwr_edid integer NULL
  ,grundstcsbschrib_gbude_adresse bigint NULL
)
;
CREATE INDEX gebaeudeeingangadresse_t_basket_idx ON test_dataimport.gebaeudeeingangadresse ( t_basket );
CREATE INDEX gebaeudeeingangadresse_t_datasetname_idx ON test_dataimport.gebaeudeeingangadresse ( t_datasetname );
CREATE INDEX gebaeudeeingangadresse_grundstcsbschrib_gbd_drsse_idx ON test_dataimport.gebaeudeeingangadresse ( grundstcsbschrib_gbude_adresse );
COMMENT ON TABLE test_dataimport.gebaeudeeingangadresse IS 'gem. SN 612040 bzw. GWR.';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.strasse IS 'Der Strassenname, z.B. Blümlisalpstrasse.
DM01: Gebaeudeadressen.Gebaeudeeingang
->Lokalisation->Text; Art==Strasse/Platz';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.hausnummer IS 'Die Hauseingangsnummer, z.B. 65A.
DM01: Gebaeudeadressen.Gebaeudeeingang->Hausnummer';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.gebaeudebezeichnung IS 'Die Objektbeschreibung, z.B. Hotel Anker.
DM01: GebaeudeName->Text';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.benanntesgebiet IS 'Das Quartier, z.B. Seefeld.
DM01: BenanntesGebiet->Lokalisation->Lokalisationsname->Text; Art== BenanntesGebiet';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.plz IS 'Die Postleitzahl.
DM01: PLZOrtschaft.PLZ6->PLZ';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.plzzusatzziffern IS 'Die Postleitzahlzusatzziffern. (Zusammen mit PLZ eindeutiger Verweis auf Postleitzahlenverzeichnis der Post.)
DM01: PLZOrtschaft.PLZ6->Zusatzziffern';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.ortschaft IS 'Die Ortsbezeichnung, z.B. Bern. Falls erforderlich inkl. Kantonskürzel, z.B. Muri/BE.
DM01: PLZOrtschaft.PLZ6->OrtschaftZuPLZ';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.gwr_egid IS 'Wert nur vorhanden, falls der Gebäudegrundriss (Bodenbedeckungs-/Einzelobjektfläche) in der AV mehrere GWR Gebäude representiert.
s.a. Kap. 6.5 in
http://www.cadastre.ch/pub/down/publications/kva/ve/VE_05_14_Beilage_de.pdf';
COMMENT ON COLUMN test_dataimport.gebaeudeeingangadresse.gwr_edid IS 'Eidg. Eingang-Identifikator wenn verfuegbar.
DM01: Gebaeudeadressen.Gebaeudeeingang->GWR_EDID';
-- GB2AV.MutationsNummer
CREATE TABLE test_dataimport.mutationsnummer (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,nummer varchar(12) NOT NULL
  ,nbident varchar(12) NOT NULL
  ,grundstcsbsb_grndsteck_letztevollzogenemutation bigint NULL
  ,vollzgsggnszgsggnstand_mutationsnummer bigint NULL
  ,mutationstabll_vmttion_mutationsnummer bigint NULL
  ,muttnstbll_ttnsnnltion_mutationsnummer bigint NULL
)
;
CREATE INDEX mutationsnummer_t_basket_idx ON test_dataimport.mutationsnummer ( t_basket );
CREATE INDEX mutationsnummer_t_datasetname_idx ON test_dataimport.mutationsnummer ( t_datasetname );
CREATE INDEX mutationsnummer_grundstcsbsb_tvllzgnmttion_idx ON test_dataimport.mutationsnummer ( grundstcsbsb_grndsteck_letztevollzogenemutation );
CREATE INDEX mutationsnummer_vollzgsggnszgnd_mttnsnmmer_idx ON test_dataimport.mutationsnummer ( vollzgsggnszgsggnstand_mutationsnummer );
CREATE INDEX mutationsnummer_muttnstbll_vmtn_mttnsnmmer_idx ON test_dataimport.mutationsnummer ( mutationstabll_vmttion_mutationsnummer );
CREATE INDEX mutationsnummer_muttnstbll_tttn_mttnsnmmer_idx ON test_dataimport.mutationsnummer ( muttnstbll_ttnsnnltion_mutationsnummer );
COMMENT ON TABLE test_dataimport.mutationsnummer IS 'Schweiz-weite, eindeutge Kennung einer Mutation.';
COMMENT ON COLUMN test_dataimport.mutationsnummer.nummer IS 'Die Nummer der Mutation. Diese wird durch den Geometer vergeben. Die Mutationsnummer ist pro Kreis eindeutig. (In der Regel das Jahr und eine Laufnummer.)
DM01: Liegenschaften.LSNachfuehrung->Identifikator';
COMMENT ON COLUMN test_dataimport.mutationsnummer.nbident IS 'Die Nummer eines Kreises wird je nach Kanton unterschiedlich vergeben. Diese Nummern entsprechen dem Nummerierungsbereich aus dem DM01, d.h. Kantonskürzel + 10 stelliger durch den Kanton organisierter Code.
DM01: Liegenschaften.LSNachfuehrung->NBIdent';
COMMENT ON COLUMN test_dataimport.mutationsnummer.grundstcsbsb_grndsteck_letztevollzogenemutation IS 'Die Nummer der letzten vollzogenen, dieses Grundstück betreffenden, Mutation.
Ab KS3-20050901 nicht mehr verwenden!';
COMMENT ON COLUMN test_dataimport.mutationsnummer.vollzgsggnszgsggnstand_mutationsnummer IS 'Nummer der Mutation, die diese Vollzugsinformation betrifft.';
COMMENT ON COLUMN test_dataimport.mutationsnummer.mutationstabll_vmttion_mutationsnummer IS 'Die Nummer der Mutation. Diese wird durch den Geometer vergeben.';
COMMENT ON COLUMN test_dataimport.mutationsnummer.muttnstbll_ttnsnnltion_mutationsnummer IS 'Die Nummer der Mutation, die widerrufen wird.';
-- GB2AV.Eigentumsverhaeltnis.Grundstueck
CREATE TABLE test_dataimport.eigentumsvrhltnis_grundstueck (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,art varchar(255) NULL
)
;
CREATE INDEX eigentumsvrhltns_grndsteck_t_basket_idx ON test_dataimport.eigentumsvrhltnis_grundstueck ( t_basket );
CREATE INDEX eigentumsvrhltns_grndsteck_t_datasetname_idx ON test_dataimport.eigentumsvrhltnis_grundstueck ( t_datasetname );
COMMENT ON TABLE test_dataimport.eigentumsvrhltnis_grundstueck IS 'Angaben zu einem Grundstück.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_grundstueck.art IS 'Die Art des Grundstücks, z.B. Liegenschaft.';
-- GB2AV.Eigentumsverhaeltnis.Person
CREATE TABLE test_dataimport.eigentumsvrhltnis_person (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,art varchar(255) NULL
  ,aname varchar(200) NOT NULL
  ,vorname varchar(30) NULL
  ,strasse varchar(60) NULL
  ,hausnummer varchar(12) NULL
  ,gebaeudebezeichnung varchar(60) NULL
  ,ortsteil varchar(60) NULL
  ,plz varchar(15) NULL
  ,ortschaft varchar(40) NULL
  ,land varchar(20) NULL
  ,geburtsjahr integer NULL
  ,geburtsmonat integer NULL
  ,geburtstag integer NULL
  ,zusatzinformationempfaenger varchar(40) NULL
  ,postdienstleistung varchar(30) NULL
  ,geschlecht varchar(255) NULL
  ,sitz varchar(40) NULL
  ,epid varchar(20) NULL
  ,auid varchar(20) NULL
)
;
CREATE INDEX eigentumsvrhltnis_person_t_basket_idx ON test_dataimport.eigentumsvrhltnis_person ( t_basket );
CREATE INDEX eigentumsvrhltnis_person_t_datasetname_idx ON test_dataimport.eigentumsvrhltnis_person ( t_datasetname );
COMMENT ON TABLE test_dataimport.eigentumsvrhltnis_person IS 'Angaben zu einer Person.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.art IS 'Die Art der Person, z.B. natürliche Person oder AG.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.aname IS 'Name der Person oder Firma, z.B. "Meier" oder "Kiosk AG".';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.vorname IS 'Vorname der Person.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.strasse IS 'Der Strassenname, z.B. Blümlisalpstrasse.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.hausnummer IS 'Die Hauseingangsnummer, z.B. 65A.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.gebaeudebezeichnung IS 'Die Objektbeschreibung, z.B. Hotel Anker.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.ortsteil IS 'Das Quartier, z.B. Seefeld.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.plz IS 'Die Postleitzahl.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.ortschaft IS 'Der Name des Orts, z.B. Bern. Falls erforderlich inkl. Kantonskürzel, z.B. Muri/BE.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.land IS 'Der Name des Landes, falls die Adresse der Person nicht in der Schweiz ist.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.geburtsjahr IS 'Geburtsjahr der Person.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.geburtsmonat IS 'Geburtsmonat der Person.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.geburtstag IS 'Geburtstag der Person.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.zusatzinformationempfaenger IS 'Zusätzliche Empfängerinformation, z.B. c/o.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.postdienstleistung IS 'Postlagernd oder das Postfach des Empfängers, z.B. "Postlagernd" oder "Postfach 33" oder leer wenn der Empfänger kein Postfach hat.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.geschlecht IS 'Das Geschlecht einer natürlichen Person (z.B. weiblich).';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.sitz IS 'Der Sitz einer juristischen Person.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.epid IS 'Eidg. Personen Identifikator.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_person.auid IS 'Eidg. Unternehmensidentifikator';
-- GB2AV.Eigentumsverhaeltnis.RechtGrundstueck
CREATE TABLE test_dataimport.eigentumsvrhltnis_rechtgrundstueck (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,subjektivdinglich boolean NOT NULL
  ,berechtigtesgrundstueck bigint NOT NULL
  ,anteilzaehler integer NULL
  ,anteilnenner integer NULL
  ,bemerkungen varchar(200) NULL
  ,betroffenesgrundstueck bigint NULL
)
;
CREATE INDEX eigntmsvrhltnrchtgrndsteck_t_basket_idx ON test_dataimport.eigentumsvrhltnis_rechtgrundstueck ( t_basket );
CREATE INDEX eigntmsvrhltnrchtgrndsteck_t_datasetname_idx ON test_dataimport.eigentumsvrhltnis_rechtgrundstueck ( t_datasetname );
CREATE INDEX eigntmsvrhltnrchtgrndsteck_berechtigtesgrundstueck_idx ON test_dataimport.eigentumsvrhltnis_rechtgrundstueck ( berechtigtesgrundstueck );
CREATE INDEX eigntmsvrhltnrchtgrndsteck_betroffenesgrundstueck_idx ON test_dataimport.eigentumsvrhltnis_rechtgrundstueck ( betroffenesgrundstueck );
COMMENT ON TABLE test_dataimport.eigentumsvrhltnis_rechtgrundstueck IS 'Stellt die Veknüpfung vom Grundstück zu einem anderen Grundstück her, falls es sich um ein Grundstück handelt, das am Grundstück berechtigt ist.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtgrundstueck.subjektivdinglich IS 'Definiert, ob es sich um ein Recht handelt, dass fest mit dem  berechtigten Grundstück verknüpft ist.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtgrundstueck.berechtigtesgrundstueck IS 'Das berechtigte Grundstück.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtgrundstueck.anteilzaehler IS 'Zähler der Bruchzahl, falls es sich um einen Teil-Recht handelt.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtgrundstueck.anteilnenner IS 'Nenner der Bruchzahl, falls es sich um einen Teil-Recht handelt.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtgrundstueck.bemerkungen IS 'z.B. un demi d''un demi';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtgrundstueck.betroffenesgrundstueck IS 'Das Grundstück, auf das sich das Recht bezieht.';
-- GB2AV.Eigentumsverhaeltnis.RechtPerson
CREATE TABLE test_dataimport.eigentumsvrhltnis_rechtperson (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,art varchar(255) NULL
  ,berechtigter bigint NULL
  ,anteilzaehler integer NULL
  ,anteilnenner integer NULL
  ,bemerkungen varchar(200) NULL
  ,betroffenesgrundstueck bigint NULL
)
;
CREATE INDEX eigentumsvrhltns_rchtprson_t_basket_idx ON test_dataimport.eigentumsvrhltnis_rechtperson ( t_basket );
CREATE INDEX eigentumsvrhltns_rchtprson_t_datasetname_idx ON test_dataimport.eigentumsvrhltnis_rechtperson ( t_datasetname );
CREATE INDEX eigentumsvrhltns_rchtprson_berechtigter_idx ON test_dataimport.eigentumsvrhltnis_rechtperson ( berechtigter );
CREATE INDEX eigentumsvrhltns_rchtprson_betroffenesgrundstueck_idx ON test_dataimport.eigentumsvrhltnis_rechtperson ( betroffenesgrundstueck );
COMMENT ON TABLE test_dataimport.eigentumsvrhltnis_rechtperson IS 'Stellt die Verknüpfung vom Grundstück zur Person her, falls es sich um eine Person handelt, die am Grundstück berechtigt ist.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtperson.art IS 'Art des Rechts, z.B. Alleineigentum.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtperson.berechtigter IS 'Berechtigte Person.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtperson.anteilzaehler IS 'Zähler der Bruchzahl, falls es sich um einen Teil-Recht handelt.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtperson.anteilnenner IS 'Nenner der Bruchzahl, falls es sich um einen Teil-Recht handelt.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtperson.bemerkungen IS 'z.B. un demi d''un demi';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_rechtperson.betroffenesgrundstueck IS 'Das Grundstück, auf das sich das Recht bezieht.';
-- GB2AV.Eigentumsverhaeltnis.GemeinschaftTeilhaber
CREATE TABLE test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,gemeinschaft bigint NOT NULL
  ,teilhaber bigint NOT NULL
)
;
CREATE INDEX eigntmsvrhltnmnschfttlhber_t_basket_idx ON test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber ( t_basket );
CREATE INDEX eigntmsvrhltnmnschfttlhber_t_datasetname_idx ON test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber ( t_datasetname );
CREATE INDEX eigntmsvrhltnmnschfttlhber_gemeinschaft_idx ON test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber ( gemeinschaft );
CREATE INDEX eigntmsvrhltnmnschfttlhber_teilhaber_idx ON test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber ( teilhaber );
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber.gemeinschaft IS 'Die Gemeinschaft, z.B. die Erbengemeinschaft, in der diese Person Teilhaber ist.';
COMMENT ON COLUMN test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber.teilhaber IS 'Falls dieses Objekt eine Gemeinschaft ist, sind dies die Teilhaber (z.B. die Erben) dieser Gemeinschaft (z.B. die Erbengemeinschaft).';
-- GB2AV.Grundstuecksbeschrieb.AVBemerkung
CREATE TABLE test_dataimport.grundstcsbschrieb_avbemerkung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Type varchar(60) NOT NULL
  ,art varchar(255) NOT NULL
  ,andereart varchar(20) NULL
  ,bemerkung varchar(200) NULL
)
;
CREATE INDEX grundstcsbschrieb_vbmrkung_t_basket_idx ON test_dataimport.grundstcsbschrieb_avbemerkung ( t_basket );
CREATE INDEX grundstcsbschrieb_vbmrkung_t_datasetname_idx ON test_dataimport.grundstcsbschrieb_avbemerkung ( t_datasetname );
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_avbemerkung.andereart IS 'falls Art==#andere';
-- GB2AV.Grundstuecksbeschrieb.BodbdAnteil
CREATE TABLE test_dataimport.grundstcsbschrieb_bodbdanteil (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,art varchar(255) NOT NULL
  ,flaechenmass decimal(11,1) NOT NULL
  ,artbezeichnung varchar(40) NULL
  ,grundstcsbsb_grndsteck_bodbdanteil bigint NULL
)
;
CREATE INDEX grundstcsbschrib_bdbdnteil_t_basket_idx ON test_dataimport.grundstcsbschrieb_bodbdanteil ( t_basket );
CREATE INDEX grundstcsbschrib_bdbdnteil_t_datasetname_idx ON test_dataimport.grundstcsbschrieb_bodbdanteil ( t_datasetname );
CREATE INDEX grundstcsbschrib_bdbdnteil_grundstcsbsb_tck_bdbdnteil_idx ON test_dataimport.grundstcsbschrieb_bodbdanteil ( grundstcsbsb_grndsteck_bodbdanteil );
COMMENT ON TABLE test_dataimport.grundstcsbschrieb_bodbdanteil IS 'Angaben zur Bodenbedeckung.';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_bodbdanteil.art IS 'Die Art der Bodenbedeckung, z.B. Schilfgürtel.
DM01: Bodenbedeckung.BoFlaeche->Art';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_bodbdanteil.flaechenmass IS 'Die Grösse der einzelnen Bodenbedeckungsfläche.
DM01: muss aus der Geometrie berechnet werden.';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_bodbdanteil.artbezeichnung IS 'Die Art der Bodenbedeckung als Klartext.';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_bodbdanteil.grundstcsbsb_grndsteck_bodbdanteil IS 'Die Bodenbedeckungsanteile.
DM01: muss berechnet werden, durch Schnitt mit Thema Bodenbedeckung';
-- GB2AV.Grundstuecksbeschrieb.Gebaeude
CREATE TABLE test_dataimport.grundstcsbschrieb_gebaeude (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,gwr_egid integer NULL
  ,istprojektiert boolean NOT NULL
  ,istunterirdisch boolean NOT NULL
  ,nummer varchar(12) NULL
  ,gebaeudeart varchar(30) NULL
  ,gebaeudeartcode varchar(4) NULL
  ,flaechenmass decimal(11,1) NOT NULL
)
;
CREATE INDEX grundstcsbschrieb_gebaeude_t_basket_idx ON test_dataimport.grundstcsbschrieb_gebaeude ( t_basket );
CREATE INDEX grundstcsbschrieb_gebaeude_t_datasetname_idx ON test_dataimport.grundstcsbschrieb_gebaeude ( t_datasetname );
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_gebaeude.gwr_egid IS 'Kein Wert vorhanden (Leer/NULL), falls kein GWR_EGID in der AV vorhanden ist, oder falls der Gebäudegrundriss (Bodenbedeckungs-/Einzelobjektfläche) in der AV mehrere GWR Gebäude representiert.';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_gebaeude.gebaeudeart IS 'DM01OS: Gebaeudenummer->Gebaeudehauptnutzung';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_gebaeude.gebaeudeartcode IS 'DM01OS: Gebaeudenummer->Nutzungscode
DM01FR: Code_Csol_FR';
-- GB2AV.Grundstuecksbeschrieb.Grundstueck
CREATE TABLE test_dataimport.grundstcsbschrieb_grundstueck (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Type varchar(60) NOT NULL
  ,flaechenmass decimal(11,1) NULL
  ,grundstueckart varchar(255) NULL
  ,kantonaleunterart varchar(60) NULL
  ,korrektur decimal(6,1) NULL
  ,korrigiertesflaechenmass decimal(11,1) NULL
  ,korrektur1 decimal(6,1) NULL
  ,korrigiertesflaechenmass1 decimal(11,1) NULL
)
;
CREATE INDEX grundstcsbschrib_grndsteck_t_basket_idx ON test_dataimport.grundstcsbschrieb_grundstueck ( t_basket );
CREATE INDEX grundstcsbschrib_grndsteck_t_datasetname_idx ON test_dataimport.grundstcsbschrieb_grundstueck ( t_datasetname );
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_grundstueck.flaechenmass IS 'Die Grösse dieses Grundstücks.';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_grundstueck.korrektur IS 'leer wenn keine Flächekorrektur erfolgt.';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_grundstueck.korrigiertesflaechenmass IS 'leer wenn keine Flächenkorrektur erfolgt. (bisherige Fläche+Koorektur==korrigiertesFlaechenmass)';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_grundstueck.korrektur1 IS 'leer wenn keine Flächenkorrektur erfolgt.';
COMMENT ON COLUMN test_dataimport.grundstcsbschrieb_grundstueck.korrigiertesflaechenmass1 IS 'leer wenn keine Flächenkorrektur erfolgt. (bisherige Fläche+Koorektur==korrigiertesFlaechenmass)';
-- GB2AV.Grundstuecksbeschrieb.AVBemerkungGrundstueck
CREATE TABLE test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,avbemerkung bigint NOT NULL
  ,grundstueck bigint NOT NULL
)
;
CREATE INDEX grundstcsbschrknggrndsteck_t_basket_idx ON test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck ( t_basket );
CREATE INDEX grundstcsbschrknggrndsteck_t_datasetname_idx ON test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck ( t_datasetname );
CREATE INDEX grundstcsbschrknggrndsteck_avbemerkung_idx ON test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck ( avbemerkung );
CREATE INDEX grundstcsbschrknggrndsteck_grundstueck_idx ON test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck ( grundstueck );
-- GB2AV.Grundstuecksbeschrieb.GrundstueckGebaeude
CREATE TABLE test_dataimport.grundstcsbschrieb_grundstueckgebaeude (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,gebaeude bigint NOT NULL
  ,grundstueck bigint NOT NULL
  ,flaechenmass decimal(11,1) NOT NULL
)
;
CREATE INDEX grundstcsbschgrndstckgbude_t_basket_idx ON test_dataimport.grundstcsbschrieb_grundstueckgebaeude ( t_basket );
CREATE INDEX grundstcsbschgrndstckgbude_t_datasetname_idx ON test_dataimport.grundstcsbschrieb_grundstueckgebaeude ( t_datasetname );
CREATE INDEX grundstcsbschgrndstckgbude_gebaeude_idx ON test_dataimport.grundstcsbschrieb_grundstueckgebaeude ( gebaeude );
CREATE INDEX grundstcsbschgrndstckgbude_grundstueck_idx ON test_dataimport.grundstcsbschrieb_grundstueckgebaeude ( grundstueck );
COMMENT ON TABLE test_dataimport.grundstcsbschrieb_grundstueckgebaeude IS 'Gebaeude zu allen überdeckten Liegenschaften und falls vorhanden Baurechten liefern. Der Grundbuchverwalter entscheidet selbst, bei welchem Grundstücksbeschrieb das Gebaeude eingetragen wird.';
-- GB2AV.Grundstuecksbeschrieb.Anteil
CREATE TABLE test_dataimport.grundstcsbschrieb_anteil (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,flaeche bigint NOT NULL
  ,liegt_auf bigint NOT NULL
  ,flaechenmass decimal(11,1) NULL
)
;
CREATE INDEX grundstcsbschrieb_anteil_t_basket_idx ON test_dataimport.grundstcsbschrieb_anteil ( t_basket );
CREATE INDEX grundstcsbschrieb_anteil_t_datasetname_idx ON test_dataimport.grundstcsbschrieb_anteil ( t_datasetname );
CREATE INDEX grundstcsbschrieb_anteil_flaeche_idx ON test_dataimport.grundstcsbschrieb_anteil ( flaeche );
CREATE INDEX grundstcsbschrieb_anteil_liegt_auf_idx ON test_dataimport.grundstcsbschrieb_anteil ( liegt_auf );
-- GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand
CREATE TABLE test_dataimport.vollzugsgegnstnde_vollzugsgegenstand (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,astatus varchar(255) NOT NULL
  ,bemerkungen varchar(200) NULL
  ,grundbucheintrag varchar(10) NULL
  ,tagebucheintrag varchar(20) NULL
  ,tagebuchbeleg varchar(20) NULL
)
;
CREATE INDEX vollzgsggnstnllzgsggnstand_t_basket_idx ON test_dataimport.vollzugsgegnstnde_vollzugsgegenstand ( t_basket );
CREATE INDEX vollzgsggnstnllzgsggnstand_t_datasetname_idx ON test_dataimport.vollzugsgegnstnde_vollzugsgegenstand ( t_datasetname );
COMMENT ON TABLE test_dataimport.vollzugsgegnstnde_vollzugsgegenstand IS 'Angaben zum Vollzug einer Mutation im Grundbuch.';
COMMENT ON COLUMN test_dataimport.vollzugsgegnstnde_vollzugsgegenstand.astatus IS 'Aktueller Status der Mutation im Grundbuch, z.B. Eintrag.';
COMMENT ON COLUMN test_dataimport.vollzugsgegnstnde_vollzugsgegenstand.bemerkungen IS 'z.B. der Grund für die Abweisung';
COMMENT ON COLUMN test_dataimport.vollzugsgegnstnde_vollzugsgegenstand.grundbucheintrag IS 'Datum des rechtsgültigen Eintrags im Grundbuch.';
COMMENT ON COLUMN test_dataimport.vollzugsgegnstnde_vollzugsgegenstand.tagebucheintrag IS 'Datum des Tagebucheintrags im Grundbuch';
COMMENT ON COLUMN test_dataimport.vollzugsgegnstnde_vollzugsgegenstand.tagebuchbeleg IS 'Zusammen mit Attribut TagebuchEintrag Referenz auf das Tagebuch.';
-- GB2AV.Mutationstabelle.Abschnitt
CREATE TABLE test_dataimport.mutationstabelle_abschnitt (
  grundstcsbsb_grndsteck_zugang bigint NULL
  ,T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,T_Seq bigint NULL
  ,flaechenmass decimal(11,1) NOT NULL
)
;
CREATE INDEX mutationstabelle_abschnitt_grundstcsbsb_rndstck_zgang_idx ON test_dataimport.mutationstabelle_abschnitt ( grundstcsbsb_grndsteck_zugang );
CREATE INDEX mutationstabelle_abschnitt_t_basket_idx ON test_dataimport.mutationstabelle_abschnitt ( t_basket );
CREATE INDEX mutationstabelle_abschnitt_t_datasetname_idx ON test_dataimport.mutationstabelle_abschnitt ( t_datasetname );
COMMENT ON COLUMN test_dataimport.mutationstabelle_abschnitt.grundstcsbsb_grndsteck_zugang IS 'Abschnittsfläche die der Liegenschaft hinzugefügt wird. Je nach Art der Mutation, werden keine Abschnittsflächen ausgewiesen (z.B. Neuvermessung).';
-- GB2AV.Mutationstabelle.AVMutation
CREATE TABLE test_dataimport.mutationstabelle_avmutation (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,beschrieb varchar(50) NULL
  ,dateinameplan varchar(80) NULL
  ,endetechnbereit varchar(10) NOT NULL
  ,istprojektmutation varchar(255) NOT NULL
)
;
CREATE INDEX mutationstabelle_avmuttion_t_basket_idx ON test_dataimport.mutationstabelle_avmutation ( t_basket );
CREATE INDEX mutationstabelle_avmuttion_t_datasetname_idx ON test_dataimport.mutationstabelle_avmutation ( t_datasetname );
COMMENT ON TABLE test_dataimport.mutationstabelle_avmutation IS 'Angaben zu einer AV-Mutation.';
COMMENT ON COLUMN test_dataimport.mutationstabelle_avmutation.beschrieb IS 'Kommentar des Geometers zur Mutation.';
COMMENT ON COLUMN test_dataimport.mutationstabelle_avmutation.dateinameplan IS 'Name der Datei mit dem Bild des Mutationsplan. Das Dateiformat ist GIF oder PDF.';
COMMENT ON COLUMN test_dataimport.mutationstabelle_avmutation.endetechnbereit IS 'Datum der technischen Fertigstellung der Mutation (DM01: Liegenschaften.LSNachfuehrung->GueltigerEintrag bzw. bei alten Daten je nach Kanton Datum1 oder Datum2)';
COMMENT ON COLUMN test_dataimport.mutationstabelle_avmutation.istprojektmutation IS 'Hinweis das zu dieser Mutation eine Abschlussmutation erforderlich ist.';
-- GB2AV.Mutationstabelle.AVMutationsAnnulation
CREATE TABLE test_dataimport.mutationstabelle_avmutationsannulation (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,bemerkungen varchar(200) NULL
)
;
CREATE INDEX mutatinstbll_vmttnsnnltion_t_basket_idx ON test_dataimport.mutationstabelle_avmutationsannulation ( t_basket );
CREATE INDEX mutatinstbll_vmttnsnnltion_t_datasetname_idx ON test_dataimport.mutationstabelle_avmutationsannulation ( t_datasetname );
COMMENT ON TABLE test_dataimport.mutationstabelle_avmutationsannulation IS 'Meldung für die Widerrufung einer Mutation durch den Geometer. z.B. wenn die Frist abgelaufen ist oder der Kunde das Geschäft zurückzieht.';
COMMENT ON COLUMN test_dataimport.mutationstabelle_avmutationsannulation.bemerkungen IS 'z.B. der Grund für die Widerrufung';
-- GB2AV.Mutationstabelle.AVMutationBetroffeneGrundstuecke
CREATE TABLE test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke (
  T_Id bigint PRIMARY KEY DEFAULT nextval('test_dataimport.t_ili2db_seq')
  ,T_basket bigint NOT NULL
  ,T_datasetname varchar(200) NOT NULL
  ,avmutation bigint NOT NULL
  ,betroffenegrundstuecke bigint NOT NULL
)
;
CREATE INDEX muttnstbll_vmrffngrndstcke_t_basket_idx ON test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke ( t_basket );
CREATE INDEX muttnstbll_vmrffngrndstcke_t_datasetname_idx ON test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke ( t_datasetname );
CREATE INDEX muttnstbll_vmrffngrndstcke_avmutation_idx ON test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke ( avmutation );
CREATE INDEX muttnstbll_vmrffngrndstcke_betroffenegrundstuecke_idx ON test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke ( betroffenegrundstuecke );
COMMENT ON COLUMN test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke.avmutation IS 'Ein Grundstück hat keine Beziehung zu AVMutation, wenn es nicht Teil der Mutation ist, aber unter einem SDR (z.B. Baurecht) liegt, das Teil der Mutation ist.';
CREATE TABLE test_dataimport.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON test_dataimport.t_ili2db_basket ( dataset );
CREATE TABLE test_dataimport.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE test_dataimport.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE test_dataimport.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (iliversion,modelName)
)
;
CREATE TABLE test_dataimport.eigntmsvrhltnis_person_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.bbart (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.grundstuecksartav (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.mutationstablle_avmutation_istprojektmutation (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.grundstuecksartgb (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.grundstbschrieb_avbemerkung_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.vollzgsggnstnde_vollzugsgegenstand_status (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.eigntmsvrhltnis_person_geschlecht (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.eigntmsvrhltnis_rechtperson_art (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE test_dataimport.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE test_dataimport.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (SqlName,ColOwner)
)
;
CREATE TABLE test_dataimport.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE test_dataimport.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
ALTER TABLE test_dataimport.flurname ADD CONSTRAINT flurname_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.flurname ADD CONSTRAINT flurname_grundstcsbsb_dstck_flrnmen_fkey FOREIGN KEY ( grundstcsbsb_grndsteck_flurnamen ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.gemeinde ADD CONSTRAINT gemeinde_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.gemeinde ADD CONSTRAINT gemeinde_grundstcsbsb_rndstck_gmnde_fkey FOREIGN KEY ( grundstcsbsb_grndsteck_gemeinde ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstuecknummer ADD CONSTRAINT grundstuecknummer_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstuecknummer ADD CONSTRAINT grundstuecknummer_eigntmsvrhls_rndstck_nmmer_fkey FOREIGN KEY ( eigntmsvrhls_grndsteck_nummer ) REFERENCES test_dataimport.eigentumsvrhltnis_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstuecknummer ADD CONSTRAINT grundstuecknummer_grundstcsbsb_rndstck_nmmer_fkey FOREIGN KEY ( grundstcsbsb_grndsteck_nummer ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstuecknummer ADD CONSTRAINT grundstuecknummer_mutationstbll_bschnitt_von_fkey FOREIGN KEY ( mutationstbll_bschnitt_von ) REFERENCES test_dataimport.mutationstabelle_abschnitt DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstuecknummer ADD CONSTRAINT grundstuecknummer_muttnstbll_vmschtgrndstcke_fkey FOREIGN KEY ( mutationstabll_vmttion_geloeschtegrundstuecke ) REFERENCES test_dataimport.mutationstabelle_avmutation DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.gbplan ADD CONSTRAINT gbplan_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.gbplan ADD CONSTRAINT gbplan_grundstcsbsb_dstck_gbplene_fkey FOREIGN KEY ( grundstcsbsb_grndsteck_gbplaene ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.gebaeudeeingangadresse ADD CONSTRAINT gebaeudeeingangadresse_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.gebaeudeeingangadresse ADD CONSTRAINT gebaeudeeingangadresse_grundstcsbschrib_gbd_drsse_fkey FOREIGN KEY ( grundstcsbschrib_gbude_adresse ) REFERENCES test_dataimport.grundstcsbschrieb_gebaeude DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationsnummer ADD CONSTRAINT mutationsnummer_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationsnummer ADD CONSTRAINT mutationsnummer_grundstcsbsb_tvllzgnmttion_fkey FOREIGN KEY ( grundstcsbsb_grndsteck_letztevollzogenemutation ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationsnummer ADD CONSTRAINT mutationsnummer_vollzgsggnszgnd_mttnsnmmer_fkey FOREIGN KEY ( vollzgsggnszgsggnstand_mutationsnummer ) REFERENCES test_dataimport.vollzugsgegnstnde_vollzugsgegenstand DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationsnummer ADD CONSTRAINT mutationsnummer_muttnstbll_vmtn_mttnsnmmer_fkey FOREIGN KEY ( mutationstabll_vmttion_mutationsnummer ) REFERENCES test_dataimport.mutationstabelle_avmutation DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationsnummer ADD CONSTRAINT mutationsnummer_muttnstbll_tttn_mttnsnmmer_fkey FOREIGN KEY ( muttnstbll_ttnsnnltion_mutationsnummer ) REFERENCES test_dataimport.mutationstabelle_avmutationsannulation DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_grundstueck ADD CONSTRAINT eigentumsvrhltns_grndsteck_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_person ADD CONSTRAINT eigentumsvrhltnis_person_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_rechtgrundstueck ADD CONSTRAINT eigntmsvrhltnrchtgrndsteck_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_rechtgrundstueck ADD CONSTRAINT eigntmsvrhltnrchtgrndsteck_berechtigtesgrundstueck_fkey FOREIGN KEY ( berechtigtesgrundstueck ) REFERENCES test_dataimport.eigentumsvrhltnis_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_rechtgrundstueck ADD CONSTRAINT eigntmsvrhltnrchtgrndsteck_betroffenesgrundstueck_fkey FOREIGN KEY ( betroffenesgrundstueck ) REFERENCES test_dataimport.eigentumsvrhltnis_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_rechtperson ADD CONSTRAINT eigentumsvrhltns_rchtprson_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_rechtperson ADD CONSTRAINT eigentumsvrhltns_rchtprson_berechtigter_fkey FOREIGN KEY ( berechtigter ) REFERENCES test_dataimport.eigentumsvrhltnis_person DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_rechtperson ADD CONSTRAINT eigentumsvrhltns_rchtprson_betroffenesgrundstueck_fkey FOREIGN KEY ( betroffenesgrundstueck ) REFERENCES test_dataimport.eigentumsvrhltnis_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber ADD CONSTRAINT eigntmsvrhltnmnschfttlhber_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber ADD CONSTRAINT eigntmsvrhltnmnschfttlhber_gemeinschaft_fkey FOREIGN KEY ( gemeinschaft ) REFERENCES test_dataimport.eigentumsvrhltnis_person DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.eigentumsvrhltnis_gemeinschaftteilhaber ADD CONSTRAINT eigntmsvrhltnmnschfttlhber_teilhaber_fkey FOREIGN KEY ( teilhaber ) REFERENCES test_dataimport.eigentumsvrhltnis_person DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_avbemerkung ADD CONSTRAINT grundstcsbschrieb_vbmrkung_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_bodbdanteil ADD CONSTRAINT grundstcsbschrib_bdbdnteil_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_bodbdanteil ADD CONSTRAINT grundstcsbschrib_bdbdnteil_grundstcsbsb_tck_bdbdnteil_fkey FOREIGN KEY ( grundstcsbsb_grndsteck_bodbdanteil ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_gebaeude ADD CONSTRAINT grundstcsbschrieb_gebaeude_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_grundstueck ADD CONSTRAINT grundstcsbschrib_grndsteck_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck ADD CONSTRAINT grundstcsbschrknggrndsteck_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck ADD CONSTRAINT grundstcsbschrknggrndsteck_avbemerkung_fkey FOREIGN KEY ( avbemerkung ) REFERENCES test_dataimport.grundstcsbschrieb_avbemerkung DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_avbemerkunggrundstueck ADD CONSTRAINT grundstcsbschrknggrndsteck_grundstueck_fkey FOREIGN KEY ( grundstueck ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_grundstueckgebaeude ADD CONSTRAINT grundstcsbschgrndstckgbude_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_grundstueckgebaeude ADD CONSTRAINT grundstcsbschgrndstckgbude_gebaeude_fkey FOREIGN KEY ( gebaeude ) REFERENCES test_dataimport.grundstcsbschrieb_gebaeude DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_grundstueckgebaeude ADD CONSTRAINT grundstcsbschgrndstckgbude_grundstueck_fkey FOREIGN KEY ( grundstueck ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_anteil ADD CONSTRAINT grundstcsbschrieb_anteil_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_anteil ADD CONSTRAINT grundstcsbschrieb_anteil_flaeche_fkey FOREIGN KEY ( flaeche ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.grundstcsbschrieb_anteil ADD CONSTRAINT grundstcsbschrieb_anteil_liegt_auf_fkey FOREIGN KEY ( liegt_auf ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.vollzugsgegnstnde_vollzugsgegenstand ADD CONSTRAINT vollzgsggnstnllzgsggnstand_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationstabelle_abschnitt ADD CONSTRAINT mutationstabelle_abschnitt_grundstcsbsb_rndstck_zgang_fkey FOREIGN KEY ( grundstcsbsb_grndsteck_zugang ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationstabelle_abschnitt ADD CONSTRAINT mutationstabelle_abschnitt_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationstabelle_avmutation ADD CONSTRAINT mutationstabelle_avmuttion_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationstabelle_avmutationsannulation ADD CONSTRAINT mutatinstbll_vmttnsnnltion_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke ADD CONSTRAINT muttnstbll_vmrffngrndstcke_T_basket_fkey FOREIGN KEY ( T_basket ) REFERENCES test_dataimport.T_ILI2DB_BASKET DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke ADD CONSTRAINT muttnstbll_vmrffngrndstcke_avmutation_fkey FOREIGN KEY ( avmutation ) REFERENCES test_dataimport.mutationstabelle_avmutation DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.mutationstabelle_avmutationbetroffenegrundstuecke ADD CONSTRAINT muttnstbll_vmrffngrndstcke_betroffenegrundstuecke_fkey FOREIGN KEY ( betroffenegrundstuecke ) REFERENCES test_dataimport.grundstcsbschrieb_grundstueck DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE test_dataimport.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES test_dataimport.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON test_dataimport.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_iliversion_modelName_key ON test_dataimport.T_ILI2DB_MODEL (iliversion,modelName)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_SqlName_ColOwner_key ON test_dataimport.T_ILI2DB_ATTRNAME (SqlName,ColOwner)
;
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.GBPlan','gbplan');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.AVMutation','mutationstabelle_avmutation');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtPerson.Art','eigntmsvrhltnis_rechtperson_art');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkung.Art','grundstbschrieb_avbemerkung_art');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkungGrundstueck','grundstcsbschrieb_avbemerkunggrundstueck');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Flurname','flurname');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.GrundstueckNummer','grundstuecknummer');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand','vollzugsgegnstnde_vollzugsgegenstand');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.Person','eigentumsvrhltnis_person');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.BerechtigterRecht','eigentumsvrhltnis_berechtigterrecht');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.Abschnitt','mutationstabelle_abschnitt');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.Flaeche','grundstcsbschrieb_flaeche');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.GemeinschaftTeilhaber','eigentumsvrhltnis_gemeinschaftteilhaber');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.Anteil','grundstcsbschrieb_anteil');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.AVMutationBetroffeneGrundstuecke','mutationstabelle_avmutationbetroffenegrundstuecke');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.MutationsNummer','mutationsnummer');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Geschlecht','eigntmsvrhltnis_person_geschlecht');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtPerson','eigentumsvrhltnis_rechtperson');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.AVMutation.istProjektMutation','mutationstablle_avmutation_istprojektmutation');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude','grundstcsbschrieb_gebaeude');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.betroffenesGrundstueckRecht','eigentumsvrhltnis_betroffenesgrundstueckrecht');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand.Status','vollzgsggnstnde_vollzugsgegenstand_status');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtGrundstueck','eigentumsvrhltnis_rechtgrundstueck');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum','eigentumsvrhltnis_eigentum');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Art','eigntmsvrhltnis_person_art');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.GebaeudeeingangAdresse','gebaeudeeingangadresse');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.BodbdAnteil','grundstcsbschrieb_bodbdanteil');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.GrundstuecksArtGB','grundstuecksartgb');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.Grundstueck','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkung','grundstcsbschrieb_avbemerkung');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Gemeinde','gemeinde');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.GrundstueckGebaeude','grundstcsbschrieb_grundstueckgebaeude');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.AVMutationsAnnulation','mutationstabelle_avmutationsannulation');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.GrundstuecksArtAV','grundstuecksartav');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Eigentumsverhaeltnis.berechtigtesGrundstueckRecht','eigentumsvrhltnis_berechtigtesgrundstueckrecht');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Grundstuecksbeschrieb.Liegenschaft','grundstcsbschrieb_liegenschaft');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.Flaeche','mutationstabelle_flaeche');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.Liegenschaft','mutationstabelle_liegenschaft');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.Mutationstabelle.AVBemerkung','mutationstabelle_avbemerkung');
INSERT INTO test_dataimport.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('GB2AV.BBArt','bbart');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutation.EndeTechnBereit','endetechnbereit','mutationstabelle_avmutation',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GrundstueckNummer.EGRID','egrid','grundstuecknummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.GWR_EGID','gwr_egid','grundstcsbschrieb_gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Sitz','sitz','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.BerechtigterRecht.Berechtigter','berechtigter','eigentumsvrhltnis_rechtperson','eigentumsvrhltnis_person');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutationBetroffeneGrundstuecke.AVMutation','avmutation','mutationstabelle_avmutationbetroffenegrundstuecke','mutationstabelle_avmutation');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Grundstueck.Nummer','eigntmsvrhls_grndsteck_nummer','grundstuecknummer','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Strasse','strasse','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutation.geloeschteGrundstuecke','mutationstabll_vmttion_geloeschtegrundstuecke','grundstuecknummer','mutationstabelle_avmutation');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Gemeinde.BFSNr','bfsnr','gemeinde',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtPerson.Art','art','eigentumsvrhltnis_rechtperson',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Vorname','vorname','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutationsAnnulation.MutationsNummer','muttnstbll_ttnsnnltion_mutationsnummer','mutationsnummer','mutationstabelle_avmutationsannulation');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.Gebaeudeart','gebaeudeart','grundstcsbschrieb_gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.betroffenesGrundstueckRecht.betroffenesGrundstueck','betroffenesgrundstueck','eigentumsvrhltnis_rechtgrundstueck','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Liegenschaft.BodbdAnteil','grundstcsbsb_grndsteck_bodbdanteil','grundstcsbschrieb_bodbdanteil','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.GebaeudeBezeichnung','gebaeudebezeichnung','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.PostDienstleistung','postdienstleistung','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutation.DateinamePlan','dateinameplan','mutationstabelle_avmutation',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkungGrundstueck.AVBemerkung','avbemerkung','grundstcsbschrieb_avbemerkunggrundstueck','grundstcsbschrieb_avbemerkung');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum.Bemerkungen','bemerkungen','eigentumsvrhltnis_rechtgrundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.KantonaleUnterArt','kantonaleunterart','grundstcsbschrieb_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.Liegenschaft.Zugang','grundstcsbsb_grndsteck_zugang','mutationstabelle_abschnitt','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand.Mutationsnummer','vollzgsggnszgsggnstand_mutationsnummer','mutationsnummer','vollzugsgegnstnde_vollzugsgegenstand');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GBPlan.Nummer','nummer','gbplan',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Geburtstag','geburtstag','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.Liegenschaft.korrigiertesFlaechenmass','korrigiertesflaechenmass1','grundstcsbschrieb_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.Abschnitt.Flaechenmass','flaechenmass','mutationstabelle_abschnitt',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.ZusatzinformationEmpfaenger','zusatzinformationempfaenger','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.UID','auid','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GrundstueckNummer.Amt','amt','grundstuecknummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GrundstueckNummer.SubKreis','subkreis','grundstuecknummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Anteil.Flaechenmass','flaechenmass','grundstcsbschrieb_anteil',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.BodbdAnteil.Flaechenmass','flaechenmass','grundstcsbschrieb_bodbdanteil',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.GemeinschaftTeilhaber.Teilhaber','teilhaber','eigentumsvrhltnis_gemeinschaftteilhaber','eigentumsvrhltnis_person');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Ortschaft','ortschaft','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Ortsteil','ortsteil','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.PLZ','plz','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.Flurnamen','grundstcsbsb_grndsteck_flurnamen','flurname','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.istUnterirdisch','istunterirdisch','grundstcsbschrieb_gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GrundstueckNummer.NummerZusatz','nummerzusatz','grundstuecknummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.MutationsNummer.Nummer','nummer','mutationsnummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.GWR_EGID','gwr_egid','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.Flaeche.Korrektur','korrektur','grundstcsbschrieb_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.Flaechenmass','flaechenmass','grundstcsbschrieb_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum.AnteilNenner','anteilnenner','eigentumsvrhltnis_rechtperson',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum.Bemerkungen','bemerkungen','eigentumsvrhltnis_rechtperson',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.GBPlaene','grundstcsbsb_grndsteck_gbplaene','gbplan','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutation.Beschrieb','beschrieb','mutationstabelle_avmutation',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutationBetroffeneGrundstuecke.betroffeneGrundstuecke','betroffenegrundstuecke','mutationstabelle_avmutationbetroffenegrundstuecke','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.Flaechenmass','flaechenmass','grundstcsbschrieb_gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand.Status','astatus','vollzugsgegnstnde_vollzugsgegenstand',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum.AnteilZaehler','anteilzaehler','eigentumsvrhltnis_rechtgrundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GrundstueckNummer.Nummer','nummer','grundstuecknummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.MutationsNummer.NBIdent','nbident','mutationsnummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.GemeinschaftTeilhaber.Gemeinschaft','gemeinschaft','eigentumsvrhltnis_gemeinschaftteilhaber','eigentumsvrhltnis_person');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.istProjektiert','istprojektiert','grundstcsbschrieb_gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.Nummer','nummer','grundstcsbschrieb_gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.GebaeudeBezeichnung','gebaeudebezeichnung','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.BodbdAnteil.ArtBezeichnung','artbezeichnung','grundstcsbschrieb_bodbdanteil',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkung.Art','art','grundstcsbschrieb_avbemerkung',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.GrundstueckArt','grundstueckart','grundstcsbschrieb_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.Nummer','grundstcsbsb_grndsteck_nummer','grundstuecknummer','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkung.AndereArt','andereart','grundstcsbschrieb_avbemerkung',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.betroffenesGrundstueckRecht.betroffenesGrundstueck','betroffenesgrundstueck','eigentumsvrhltnis_rechtperson','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Flurname.Name','aname','flurname',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.BodbdAnteil.Art','art','grundstcsbschrieb_bodbdanteil',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.EPID','epid','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Name','aname','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.Ortschaft','ortschaft','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand.TagebuchBeleg','tagebuchbeleg','vollzugsgegnstnde_vollzugsgegenstand',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Geburtsmonat','geburtsmonat','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GrundstueckNummer.Los','los','grundstuecknummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Grundstueck.Art','art','eigentumsvrhltnis_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand.GrundbuchEintrag','grundbucheintrag','vollzugsgegnstnde_vollzugsgegenstand',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtGrundstueck.SubjektivDinglich','subjektivdinglich','eigentumsvrhltnis_rechtgrundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand.TagebuchEintrag','tagebucheintrag','vollzugsgegnstnde_vollzugsgegenstand',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.Abschnitt.von','mutationstbll_bschnitt_von','grundstuecknummer','mutationstabelle_abschnitt');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutation.istProjektMutation','istprojektmutation','mutationstabelle_avmutation',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.Adresse','grundstcsbschrib_gbude_adresse','gebaeudeeingangadresse','grundstcsbschrieb_gebaeude');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkungGrundstueck.Grundstueck','grundstueck','grundstcsbschrieb_avbemerkunggrundstueck','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.berechtigtesGrundstueckRecht.berechtigtesGrundstueck','berechtigtesgrundstueck','eigentumsvrhltnis_rechtgrundstueck','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude.GebaeudeartCode','gebaeudeartcode','grundstcsbschrieb_gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.PLZ','plz','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.Strasse','strasse','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.Liegenschaft.Korrektur','korrektur1','grundstcsbschrieb_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Land','land','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum.AnteilNenner','anteilnenner','eigentumsvrhltnis_rechtgrundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.GWR_EDID','gwr_edid','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GBPlan.NBIdent','nbident','gbplan',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Anteil.flaeche','flaeche','grundstcsbschrieb_anteil','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Geschlecht','geschlecht','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand.Bemerkungen','bemerkungen','vollzugsgegnstnde_vollzugsgegenstand',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Anteil.liegt_auf','liegt_auf','grundstcsbschrieb_anteil','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.Flaeche.korrigiertesFlaechenmass','korrigiertesflaechenmass','grundstcsbschrieb_grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.letzteVollzogeneMutation','grundstcsbsb_grndsteck_letztevollzogenemutation','mutationsnummer','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Hausnummer','hausnummer','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Geburtsjahr','geburtsjahr','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum.AnteilZaehler','anteilzaehler','eigentumsvrhltnis_rechtperson',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck.Gemeinde','grundstcsbsb_grndsteck_gemeinde','gemeinde','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.GrundstueckGebaeude.Gebaeude','gebaeude','grundstcsbschrieb_grundstueckgebaeude','grundstcsbschrieb_gebaeude');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.BenanntesGebiet','benanntesgebiet','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.GrundstueckGebaeude.Grundstueck','grundstueck','grundstcsbschrieb_grundstueckgebaeude','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Eigentumsverhaeltnis.Person.Art','art','eigentumsvrhltnis_person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.Hausnummer','hausnummer','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.GrundstueckGebaeude.Flaechenmass','flaechenmass','grundstcsbschrieb_grundstueckgebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.GebaeudeeingangAdresse.PlzZusatzziffern','plzzusatzziffern','gebaeudeeingangadresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Gemeinde.Name','aname','gemeinde',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkung.Bemerkung','bemerkung','grundstcsbschrieb_avbemerkung',NULL);
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutation.MutationsNummer','mutationstabll_vmttion_mutationsnummer','mutationsnummer','mutationstabelle_avmutation');
INSERT INTO test_dataimport.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('GB2AV.Mutationstabelle.AVMutationsAnnulation.Bemerkungen','bemerkungen','mutationstabelle_avmutationsannulation',NULL);
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.GBPlan','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Mutationstabelle.AVMutation','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkungGrundstueck','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Flurname','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.GrundstueckNummer','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.Person','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.BerechtigterRecht','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Mutationstabelle.Abschnitt','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.Flaeche','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.GemeinschaftTeilhaber','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.Anteil','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Mutationstabelle.AVMutationBetroffeneGrundstuecke','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.MutationsNummer','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtPerson','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.betroffenesGrundstueckRecht','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtGrundstueck','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum','ch.ehi.ili2db.inheritance','subClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.GebaeudeeingangAdresse','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.BodbdAnteil','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.Grundstueck','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkung','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Gemeinde','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.GrundstueckGebaeude','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Mutationstabelle.AVMutationsAnnulation','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Eigentumsverhaeltnis.berechtigtesGrundstueckRecht','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Grundstuecksbeschrieb.Liegenschaft','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Mutationstabelle.Flaeche','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Mutationstabelle.Liegenschaft','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO test_dataimport.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('GB2AV.Mutationstabelle.AVBemerkung','ch.ehi.ili2db.inheritance','superClass');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.berechtigtesGrundstueckRecht',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Vollzugsgegenstaende.Vollzugsgegenstand',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Mutationstabelle.Flaeche','GB2AV.Grundstuecksbeschrieb.Flaeche');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Mutationstabelle.AVMutationsAnnulation',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.Gebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkungGrundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.GBPlan',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Mutationstabelle.Liegenschaft','GB2AV.Grundstuecksbeschrieb.Liegenschaft');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.Grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.GemeinschaftTeilhaber',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Mutationstabelle.AVMutationBetroffeneGrundstuecke',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.betroffenesGrundstueckRecht',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Flurname',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.GrundstueckGebaeude',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.Liegenschaft','GB2AV.Grundstuecksbeschrieb.Grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.GebaeudeeingangAdresse',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Gemeinde',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.Eigentum',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.Anteil',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Mutationstabelle.Abschnitt',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Mutationstabelle.AVMutation',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.BerechtigterRecht',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Mutationstabelle.AVBemerkung','GB2AV.Grundstuecksbeschrieb.AVBemerkung');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.Person',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.GrundstueckNummer',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.Flaeche','GB2AV.Grundstuecksbeschrieb.Grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.AVBemerkung',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtGrundstueck','GB2AV.Eigentumsverhaeltnis.Eigentum');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.Grundstueck',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Grundstuecksbeschrieb.BodbdAnteil',NULL);
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.Eigentumsverhaeltnis.RechtPerson','GB2AV.Eigentumsverhaeltnis.Eigentum');
INSERT INTO test_dataimport.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('GB2AV.MutationsNummer',NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaft.EinfacheGesellschaft',0,'Gemeinschaft.EinfacheGesellschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaft.KollektiveGesellschaft',1,'Gemeinschaft.KollektiveGesellschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaft.Kommanditgesellschaft',2,'Gemeinschaft.Kommanditgesellschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaft.Guetergemeinschaft',3,'Gemeinschaft.Guetergemeinschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaft.Erbengemeinschaft',4,'Gemeinschaft.Erbengemeinschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gemeinschaft.weitere',5,'Gemeinschaft.weitere',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'natuerlichePerson',6,'natuerlichePerson',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'juristischePerson.Aktiengesellschaft',7,'juristischePerson.Aktiengesellschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'juristischePerson.Kommanditaktiengesellschaft',8,'juristischePerson.Kommanditaktiengesellschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'juristischePerson.GmbH',9,'juristischePerson.GmbH',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'juristischePerson.Genossenschaft',10,'juristischePerson.Genossenschaft',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'juristischePerson.Verein',11,'juristischePerson.Verein',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'juristischePerson.Stiftung',12,'juristischePerson.Stiftung',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'juristischePerson.weitere',13,'juristischePerson.weitere',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gebaeude',0,'Gebaeude',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'befestigt.Strasse_Weg',1,'befestigt.Strasse_Weg',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'befestigt.Trottoir',2,'befestigt.Trottoir',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'befestigt.Verkehrsinsel',3,'befestigt.Verkehrsinsel',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'befestigt.Bahn',4,'befestigt.Bahn',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'befestigt.Flugplatz',5,'befestigt.Flugplatz',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'befestigt.Wasserbecken',6,'befestigt.Wasserbecken',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'befestigt.uebrige_befestigte',7,'befestigt.uebrige_befestigte',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'humusiert.Acker_Wiese_Weide',8,'humusiert.Acker_Wiese_Weide',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'humusiert.Intensivkultur.Reben',9,'humusiert.Intensivkultur.Reben',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'humusiert.Intensivkultur.uebrige_Intensivkultur',10,'humusiert.Intensivkultur.uebrige_Intensivkultur',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'humusiert.Gartenanlage',11,'humusiert.Gartenanlage',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'humusiert.Hoch_Flachmoor',12,'humusiert.Hoch_Flachmoor',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'humusiert.uebrige_humusierte',13,'humusiert.uebrige_humusierte',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gewaesser.stehendes',14,'Gewaesser.stehendes',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gewaesser.fliessendes',15,'Gewaesser.fliessendes',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Gewaesser.Schilfguertel',16,'Gewaesser.Schilfguertel',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'bestockt.geschlossener_Wald',17,'bestockt.geschlossener_Wald',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'bestockt.Wytweide.Wytweide_dicht',18,'bestockt.Wytweide.Wytweide_dicht',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'bestockt.Wytweide.Wytweide_offen',19,'bestockt.Wytweide.Wytweide_offen',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'bestockt.uebrige_bestockte',20,'bestockt.uebrige_bestockte',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vegetationslos.Fels',21,'vegetationslos.Fels',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vegetationslos.Gletscher_Firn',22,'vegetationslos.Gletscher_Firn',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vegetationslos.Geroell_Sand',23,'vegetationslos.Geroell_Sand',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vegetationslos.Abbau_Deponie',24,'vegetationslos.Abbau_Deponie',FALSE,NULL);
INSERT INTO test_dataimport.bbart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'vegetationslos.uebrige_vegetationslose',25,'vegetationslos.uebrige_vegetationslose',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartav (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Liegenschaft',0,'Liegenschaft',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartav (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SelbstRecht.Baurecht',1,'SelbstRecht.Baurecht',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartav (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SelbstRecht.Quellenrecht',2,'SelbstRecht.Quellenrecht',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartav (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SelbstRecht.Konzessionsrecht',3,'SelbstRecht.Konzessionsrecht',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartav (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'SelbstRecht.weitere',4,'SelbstRecht.weitere',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartav (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bergwerk',5,'Bergwerk',FALSE,NULL);
INSERT INTO test_dataimport.mutationstablle_avmutation_istprojektmutation (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Projekt',0,'Projekt',FALSE,NULL);
INSERT INTO test_dataimport.mutationstablle_avmutation_istprojektmutation (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Normal',1,'Normal',FALSE,NULL);
INSERT INTO test_dataimport.mutationstablle_avmutation_istprojektmutation (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abschluss',2,'Abschluss',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartgb (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Liegenschaft',0,'Liegenschaft',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartgb (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Konzession',1,'Konzession',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartgb (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'selbstdauerndesRecht',2,'selbstdauerndesRecht',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartgb (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'MitEigAnteil.Stockwerk',3,'MitEigAnteil.Stockwerk',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartgb (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'MitEigAnteil.weitere',4,'MitEigAnteil.weitere',FALSE,NULL);
INSERT INTO test_dataimport.grundstuecksartgb (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'KantonaleArt',5,'KantonaleArt',FALSE,NULL);
INSERT INTO test_dataimport.grundstbschrieb_avbemerkung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'StreitigeGrenze',0,'StreitigeGrenze',FALSE,NULL);
INSERT INTO test_dataimport.grundstbschrieb_avbemerkung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Lagefixpunkt',1,'Lagefixpunkt',FALSE,NULL);
INSERT INTO test_dataimport.grundstbschrieb_avbemerkung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Naturdenkmal',2,'Naturdenkmal',FALSE,NULL);
INSERT INTO test_dataimport.grundstbschrieb_avbemerkung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'eingedoltesGewaesser',3,'eingedoltesGewaesser',FALSE,NULL);
INSERT INTO test_dataimport.grundstbschrieb_avbemerkung_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'andere',4,'andere',FALSE,NULL);
INSERT INTO test_dataimport.vollzgsggnstnde_vollzugsgegenstand_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Eingangsmeldung',0,'Eingangsmeldung',FALSE,'Das Geschäft wurde durch den Kunden beim Grundbuchamt angemeldet.');
INSERT INTO test_dataimport.vollzgsggnstnde_vollzugsgegenstand_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Eintrag',1,'Eintrag',FALSE,NULL);
INSERT INTO test_dataimport.vollzgsggnstnde_vollzugsgegenstand_status (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Abweisung',2,'Abweisung',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_geschlecht (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'maennlich',0,'maennlich',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_person_geschlecht (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'weiblich',1,'weiblich',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_rechtperson_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'AlleinEigentum',0,'AlleinEigentum',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_rechtperson_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'MitEigentum',1,'MitEigentum',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_rechtperson_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'GesamtEigentum',2,'GesamtEigentum',FALSE,NULL);
INSERT INTO test_dataimport.eigntmsvrhltnis_rechtperson_art (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Herrenlos',3,'Herrenlos',FALSE,NULL);
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationsnummer',NULL,'vollzgsggnszgsggnstand_mutationsnummer','ch.ehi.ili2db.foreignKey','vollzugsgegnstnde_vollzugsgegenstand');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_anteil',NULL,'liegt_auf','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('flurname',NULL,'grundstcsbsb_grndsteck_flurnamen','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('eigentumsvrhltnis_gemeinschaftteilhaber',NULL,'gemeinschaft','ch.ehi.ili2db.foreignKey','eigentumsvrhltnis_person');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstuecknummer',NULL,'eigntmsvrhls_grndsteck_nummer','ch.ehi.ili2db.foreignKey','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueck','mutationstabelle_flaeche','korrigiertesflaechenmass','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('eigentumsvrhltnis_rechtperson',NULL,'betroffenesgrundstueck','ch.ehi.ili2db.foreignKey','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueckgebaeude',NULL,'grundstueck','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('gebaeudeeingangadresse',NULL,'grundstcsbschrib_gbude_adresse','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_gebaeude');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_bodbdanteil',NULL,'grundstcsbsb_grndsteck_bodbdanteil','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationsnummer',NULL,'muttnstbll_ttnsnnltion_mutationsnummer','ch.ehi.ili2db.foreignKey','mutationstabelle_avmutationsannulation');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('gbplan',NULL,'grundstcsbsb_grndsteck_gbplaene','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('eigentumsvrhltnis_rechtgrundstueck',NULL,'berechtigtesgrundstueck','ch.ehi.ili2db.foreignKey','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('eigentumsvrhltnis_gemeinschaftteilhaber',NULL,'teilhaber','ch.ehi.ili2db.foreignKey','eigentumsvrhltnis_person');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_avbemerkunggrundstueck',NULL,'avbemerkung','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_avbemerkung');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstuecknummer',NULL,'mutationstbll_bschnitt_von','ch.ehi.ili2db.foreignKey','mutationstabelle_abschnitt');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationsnummer',NULL,'mutationstabll_vmttion_mutationsnummer','ch.ehi.ili2db.foreignKey','mutationstabelle_avmutation');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueck',NULL,'flaechenmass','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueck','mutationstabelle_liegenschaft','korrektur1','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueck','mutationstabelle_flaeche','korrektur','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationstabelle_avmutationbetroffenegrundstuecke',NULL,'betroffenegrundstuecke','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('eigentumsvrhltnis_rechtperson',NULL,'berechtigter','ch.ehi.ili2db.foreignKey','eigentumsvrhltnis_person');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationstabelle_abschnitt',NULL,'flaechenmass','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_anteil',NULL,'flaechenmass','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_anteil',NULL,'flaeche','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('gemeinde',NULL,'grundstcsbsb_grndsteck_gemeinde','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_gebaeude',NULL,'flaechenmass','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('eigentumsvrhltnis_rechtgrundstueck',NULL,'betroffenesgrundstueck','ch.ehi.ili2db.foreignKey','eigentumsvrhltnis_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationstabelle_avmutationbetroffenegrundstuecke',NULL,'avmutation','ch.ehi.ili2db.foreignKey','mutationstabelle_avmutation');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_bodbdanteil',NULL,'flaechenmass','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_avbemerkunggrundstueck',NULL,'grundstueck','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueck',NULL,'T_Type','ch.ehi.ili2db.types','["grundstcsbschrieb_flaeche","grundstcsbschrieb_liegenschaft","mutationstabelle_flaeche","mutationstabelle_liegenschaft"]');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueckgebaeude',NULL,'flaechenmass','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstuecknummer',NULL,'grundstcsbsb_grndsteck_nummer','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationstabelle_abschnitt',NULL,'grundstcsbsb_grndsteck_zugang','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueckgebaeude',NULL,'gebaeude','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_gebaeude');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_avbemerkung',NULL,'T_Type','ch.ehi.ili2db.types','["grundstcsbschrieb_avbemerkung","mutationstabelle_avbemerkung"]');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstcsbschrieb_grundstueck','mutationstabelle_liegenschaft','korrigiertesflaechenmass1','ch.ehi.ili2db.unit','m2');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('mutationsnummer',NULL,'grundstcsbsb_grndsteck_letztevollzogenemutation','ch.ehi.ili2db.foreignKey','grundstcsbschrieb_grundstueck');
INSERT INTO test_dataimport.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('grundstuecknummer',NULL,'mutationstabll_vmttion_geloeschtegrundstuecke','ch.ehi.ili2db.foreignKey','mutationstabelle_avmutation');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstcsbschrieb_grundstueckgebaeude','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstuecksartgb','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('mutationstabelle_abschnitt','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('gebaeudeeingangadresse','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('bbart','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('eigntmsvrhltnis_person_geschlecht','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('mutationstablle_avmutation_istprojektmutation','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('gemeinde','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('eigntmsvrhltnis_person_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('mutationsnummer','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstcsbschrieb_bodbdanteil','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('flurname','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('eigentumsvrhltnis_gemeinschaftteilhaber','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('mutationstabelle_avmutationbetroffenegrundstuecke','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('gbplan','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstcsbschrieb_anteil','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstcsbschrieb_avbemerkunggrundstueck','ch.ehi.ili2db.tableKind','ASSOCIATION');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstuecksartav','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstuecknummer','ch.ehi.ili2db.tableKind','STRUCTURE');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('grundstbschrieb_avbemerkung_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('vollzgsggnstnde_vollzugsgegenstand_status','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('eigntmsvrhltnis_rechtperson_art','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO test_dataimport.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('KS3-20060703.ili','2.2','GB2AV','INTERLIS 2.2;

/** Dieses Datenmodell beschreibt die auszutauschenden Daten zwischen "Grundbuch" und "Amtliche Vermessung".
 * Das Datenmodell ist in vier Themen (Gruppen bzw. Pakete) unterteilt, einerseits um den rechtsgültigen Teil vom provisorischen zu trennen, und andererseits um die Datenhoheit (Grundbuch oder Amtliche Vermessung) zu respektieren.
 * @Version 2006-07-03
 * @Author ceis
 */
MODEL GB2AV (de) =
  CONTRACT ISSUED BY VD_GBA;

  UNIT

    /** Einheit für ein Flächenmass.
     */
    Area (ABSTRACT) = (INTERLIS.LENGTH * INTERLIS.LENGTH);

    

  DOMAIN

    /** Wertebereich für die Art der Bodenbedeckung, z.B. Schilfguertel
     */
    BBArt= (
      Gebaeude
      ,befestigt(
        Strasse_Weg
        ,Trottoir
        ,Verkehrsinsel
        ,Bahn
        ,Flugplatz
        ,Wasserbecken
        ,uebrige_befestigte
      )
      ,humusiert(
        Acker_Wiese_Weide
        ,Intensivkultur(
          Reben
          ,uebrige_Intensivkultur
        )
        ,Gartenanlage
        ,Hoch_Flachmoor
        ,uebrige_humusierte
      )
      ,Gewaesser(
        stehendes
        ,fliessendes
        ,Schilfguertel
      )
      ,bestockt(
        geschlossener_Wald
        ,Wytweide(
          Wytweide_dicht
          ,Wytweide_offen
        )
        ,uebrige_bestockte
      )
      ,vegetationslos(
        Fels
        ,Gletscher_Firn
        ,Geroell_Sand
        ,Abbau_Deponie
        ,uebrige_vegetationslose
      )
    );

    /** Datum im Format CCYY-MM-DD (gem. XML-Schema date Datentyp)
     */
    Datum= TEXT*10;

    /** Wertebereich für die Art des Grundstücks gemäss Datenmodell der Amtlichen Vermessung (gem. DM 01), z.B. Liegenschaft.
     */
    GrundstuecksArtAV= (
      Liegenschaft
      ,SelbstRecht(
        Baurecht
        ,Quellenrecht
        ,Konzessionsrecht
        ,weitere
      )
      ,Bergwerk
    );

    /** Wertebereich für die Art des Grundstücks aus der Sicht des Grundbuchs (gem. ZGB 943 ), z.B. Liegenschaft.
     */
    GrundstuecksArtGB= (
      Liegenschaft
      ,Konzession
      ,selbstdauerndesRecht
      ,MitEigAnteil(
        Stockwerk
        ,weitere
      )
      /** z.B. Fischenzrecht
       */
      ,KantonaleArt
    );

    GWR_EGID= 1..999999999;

    NBIdentAV= TEXT*12;

  /** Angaben zur Flur.
   */
  STRUCTURE Flurname =
    /** Name der Flur.
     * DM01: Nomenklatur.Flurname->Name
     */
    Name : MANDATORY TEXT*40;
  END Flurname;

  STRUCTURE Gemeinde =
    Name : MANDATORY TEXT*30;
    BFSNr : MANDATORY 1..9999;
  END Gemeinde;

  /** Schweiz-weite, eindeutge Kennung eines Grundstücks.
   * Die Nummerierung ist 5-stufig. (Amt, SubKreis, Los, Nummer, NummerZusatz). SubKreis, Los und NummerZusatz sind optional.
   */
  STRUCTURE GrundstueckNummer =
    /** Die(neue) schweizweit eindeutige Nummer eines Grundstückes. Das Nummerierungsschema muss noch durch das  Eidg. Grundbuchamt festgelegt werden.
     */
    EGRID : TEXT*14;
    /** Die Nummer des Grundstücks, ohne Angabe des Grundbuchamtes,  Subkreises oder Loses.
     * DM01: Liegenschaften. Grundstueck->Nummer
     */
    Nummer : MANDATORY TEXT*12;
    /** BE: Nummer des Teilgrundstücks. FR; Index des Grundstücks (Schlüsselfeld im Fall MCA, plans graphiques provisoires et registre foncier cantonal) 
     * DM01: Liegenschaften.Liegenschaft->NummerTeilGrundstueck
     */
    NummerZusatz : TEXT*12;
    /** Die Nummer des Grundbuchamtes. Die Nummer eines Grundbuchamtes wird durch das Eidg. Grundbuchamt festgelegt.
     * Ab KS3-20050901 nicht mehr verwenden!
     */
    Amt : TEXT*3;
    /** Die Nummer des Sub-Kreises innerhalb eines Grundbuchamtes. Die Unterteilung in Sub-Kreise und deren Nummerierung erfolgt durch das entsprechende Grundbuchamt bzw. den Kanton.
     */
    SubKreis : TEXT*15;
    /** Die Nummer des Loses innerhalb eines Subkreises. Die Unterteilung in Lose und deren Nummerierung erfolgt durch das entsprechende Grundbuchamt bzw. den Kanton.
     */
    Los : TEXT*15;
  END GrundstueckNummer;

  UNIT

    /** Die Einheit Quadratmeter.
     */
    Square_Meter [m2] EXTENDS Area = (INTERLIS.m * INTERLIS.m);

    

  /** Angaben zum Grundbuchplan
   */
  STRUCTURE GBPlan =
    /** Die Nummer des Grundbuchplans.
     * DM01: Planeinteilung.Plan->Nummer
     */
    Nummer : MANDATORY TEXT*12;
    /** Der Nummerierungsbereich, indem die Nummer eindeutig ist.
     * DM01: Planeinteilung.Plan->NBIdent
     */
    NBIdent : MANDATORY NBIdentAV;
  END GBPlan;

  /** gem. SN 612040 bzw. GWR.
   */
  STRUCTURE GebaeudeeingangAdresse =
    /** Der Strassenname, z.B. Blümlisalpstrasse.
     * DM01: Gebaeudeadressen.Gebaeudeeingang
     * ->Lokalisation->Text; Art==Strasse/Platz
     */
    Strasse : TEXT*60;
    /** Die Hauseingangsnummer, z.B. 65A.
     * DM01: Gebaeudeadressen.Gebaeudeeingang->Hausnummer
     */
    Hausnummer : TEXT*12;
    /** Die Objektbeschreibung, z.B. Hotel Anker.
     * DM01: GebaeudeName->Text
     */
    GebaeudeBezeichnung : TEXT*60;
    /** Das Quartier, z.B. Seefeld.
     * DM01: BenanntesGebiet->Lokalisation->Lokalisationsname->Text; Art== BenanntesGebiet
     */
    BenanntesGebiet : TEXT*60;
    /** Die Postleitzahl.
     * DM01: PLZOrtschaft.PLZ6->PLZ
     */
    PLZ : MANDATORY 1000..9999;
    /** Die Postleitzahlzusatzziffern. (Zusammen mit PLZ eindeutiger Verweis auf Postleitzahlenverzeichnis der Post.)
     * DM01: PLZOrtschaft.PLZ6->Zusatzziffern
     */
    PlzZusatzziffern : 0..99;
    /** Die Ortsbezeichnung, z.B. Bern. Falls erforderlich inkl. Kantonskürzel, z.B. Muri/BE.
     * DM01: PLZOrtschaft.PLZ6->OrtschaftZuPLZ
     */
    Ortschaft : MANDATORY TEXT*40;
    /** Wert nur vorhanden, falls der Gebäudegrundriss (Bodenbedeckungs-/Einzelobjektfläche) in der AV mehrere GWR Gebäude representiert.
     * s.a. Kap. 6.5 in
     * http://www.cadastre.ch/pub/down/publications/kva/ve/VE_05_14_Beilage_de.pdf
     */
    GWR_EGID : GWR_EGID;
    /** Eidg. Eingang-Identifikator wenn verfuegbar.
     * DM01: Gebaeudeadressen.Gebaeudeeingang->GWR_EDID
     */
    GWR_EDID : 0..99;
  END GebaeudeeingangAdresse;

  /** Schweiz-weite, eindeutge Kennung einer Mutation.
   */
  STRUCTURE MutationsNummer =
    /** Die Nummer der Mutation. Diese wird durch den Geometer vergeben. Die Mutationsnummer ist pro Kreis eindeutig. (In der Regel das Jahr und eine Laufnummer.)
     * DM01: Liegenschaften.LSNachfuehrung->Identifikator
     */
    Nummer : MANDATORY TEXT*12;
    /** Die Nummer eines Kreises wird je nach Kanton unterschiedlich vergeben. Diese Nummern entsprechen dem Nummerierungsbereich aus dem DM01, d.h. Kantonskürzel + 10 stelliger durch den Kanton organisierter Code.
     * DM01: Liegenschaften.LSNachfuehrung->NBIdent
     */
    NBIdent : MANDATORY NBIdentAV;
  END MutationsNummer;

  DOMAIN

    /** Wertebereich für ein Flächenmass in Quadratmeter mit einer Nachkommastelle.
     */
    Flaeche= 0.0..1000000000.0 [m2];

    FlaechenKorrektur= -10000.0..10000.0 [m2];

  /** Daten, die vom Grundbuch der Amtlichen Vermessung angeboten werden. Dieses Thema beschreibt die rechtsgültigen Eigentumsverhältnisse und dient dem Geometer zum Auffinden des Eigentümers einer Liegenschaft.
   */
  TOPIC Eigentumsverhaeltnis =

    /** Ein (Teil-)Recht, z.B. Eigentum, an einem Grundstück.
     */
    CLASS Eigentum(ABSTRACT) =
      /** Zähler der Bruchzahl, falls es sich um einen Teil-Recht handelt.
       */
      AnteilZaehler : 1..1000000000;
      /** Nenner der Bruchzahl, falls es sich um einen Teil-Recht handelt.
       */
      AnteilNenner : 1..1000000000;
      /** z.B. un demi d''un demi
       */
      Bemerkungen : TEXT*200;
    END Eigentum;

    /** Angaben zu einem Grundstück.
     */
    CLASS Grundstueck =
      /** Die Art des Grundstücks, z.B. Liegenschaft.
       */
      Art : GB2AV.GrundstuecksArtGB;
      /** Die Grundstücksnummer,
       * z.B. eine Liegenschaftennummer oder Wegrechtnummer.
       */
      Nummer : MANDATORY GB2AV.GrundstueckNummer;
      UNIQUE Nummer->Nummer, Nummer->NummerZusatz, Nummer->Amt, Nummer->SubKreis, Nummer->Los;
      
    END Grundstueck;

    /** Angaben zu einer Person.
     */
    CLASS Person =
      /** Die Art der Person, z.B. natürliche Person oder AG.
       */
      Art : (
        Gemeinschaft(
          EinfacheGesellschaft
          ,KollektiveGesellschaft
          ,Kommanditgesellschaft
          ,Guetergemeinschaft
          ,Erbengemeinschaft
          ,weitere
        )
        ,natuerlichePerson
        ,juristischePerson(
          Aktiengesellschaft
          ,Kommanditaktiengesellschaft
          ,GmbH
          ,Genossenschaft
          ,Verein
          ,Stiftung
          ,weitere
        )
      );
      /** Name der Person oder Firma, z.B. "Meier" oder "Kiosk AG".
       */
      Name : MANDATORY TEXT*200;
      /** Vorname der Person.
       */
      Vorname : TEXT*30;
      /** Der Strassenname, z.B. Blümlisalpstrasse.
       */
      Strasse : TEXT*60;
      /** Die Hauseingangsnummer, z.B. 65A.
       */
      Hausnummer : TEXT*12;
      /** Die Objektbeschreibung, z.B. Hotel Anker.
       */
      GebaeudeBezeichnung : TEXT*60;
      /** Das Quartier, z.B. Seefeld.
       */
      Ortsteil : TEXT*60;
      /** Die Postleitzahl.
       */
      PLZ : TEXT*15;
      /** Der Name des Orts, z.B. Bern. Falls erforderlich inkl. Kantonskürzel, z.B. Muri/BE.
       */
      Ortschaft : TEXT*40;
      /** Der Name des Landes, falls die Adresse der Person nicht in der Schweiz ist.
       */
      Land : TEXT*20;
      /** Geburtsjahr der Person.
       */
      Geburtsjahr : 1880..2100;
      /** Geburtsmonat der Person.
       */
      Geburtsmonat : 1..12;
      /** Geburtstag der Person.
       */
      Geburtstag : 1..31;
      /** Zusätzliche Empfängerinformation, z.B. c/o.
       */
      ZusatzinformationEmpfaenger : TEXT*40;
      /** Postlagernd oder das Postfach des Empfängers, z.B. "Postlagernd" oder "Postfach 33" oder leer wenn der Empfänger kein Postfach hat.
       */
      PostDienstleistung : TEXT*30;
      /** Das Geschlecht einer natürlichen Person (z.B. weiblich).
       */
      Geschlecht : (
        maennlich
        ,weiblich
      );
      /** Der Sitz einer juristischen Person.
       */
      Sitz : TEXT*40;
      /** Eidg. Personen Identifikator.
       */
      EPID : TEXT*20;
      /** Eidg. Unternehmensidentifikator
       */
      UID : TEXT*20;
    END Person;

    /** Stellt die Veknüpfung vom Grundstück zu einem anderen Grundstück her, falls es sich um ein Grundstück handelt, das am Grundstück berechtigt ist.
     */
    CLASS RechtGrundstueck
    EXTENDS Eigentum =
      /** Definiert, ob es sich um ein Recht handelt, dass fest mit dem  berechtigten Grundstück verknüpft ist.
       */
      SubjektivDinglich : MANDATORY BOOLEAN;
    END RechtGrundstueck;

    /** Stellt die Verknüpfung vom Grundstück zur Person her, falls es sich um eine Person handelt, die am Grundstück berechtigt ist.
     */
    CLASS RechtPerson
    EXTENDS Eigentum =
      /** Art des Rechts, z.B. Alleineigentum.
       */
      Art : (
        AlleinEigentum
        ,MitEigentum
        ,GesamtEigentum
        ,Herrenlos
      );
    END RechtPerson;

    ASSOCIATION betroffenesGrundstueckRecht =
      /** Das Grundstück, auf das sich das Recht bezieht.
       */
      betroffenesGrundstueck -<#> {1} Grundstueck;
      /** Ein Recht, z.B. Eigentum, an diesem Grundstück.
       */
      Recht -- {0..*} Eigentum;
    END betroffenesGrundstueckRecht;

    ASSOCIATION GemeinschaftTeilhaber =
      /** Die Gemeinschaft, z.B. die Erbengemeinschaft, in der diese Person Teilhaber ist.
       */
      Gemeinschaft -- {0..*} Person;
      /** Falls dieses Objekt eine Gemeinschaft ist, sind dies die Teilhaber (z.B. die Erben) dieser Gemeinschaft (z.B. die Erbengemeinschaft).
       */
      Teilhaber -- {0..*} Person;
    END GemeinschaftTeilhaber;

    ASSOCIATION BerechtigterRecht =
      /** Berechtigte Person.
       */
      Berechtigter -- {0..1} Person;
      /** Verweis auf das Grundstück.
       */
      Grundstueck -- {0..*} RechtPerson;
    END BerechtigterRecht;

    ASSOCIATION berechtigtesGrundstueckRecht =
      /** Das berechtigte Grundstück.
       */
      berechtigtesGrundstueck -- {1} Grundstueck;
      /** Verweis auf das belastete Grundstück.
       */
      belastetesGrundstueck -- {0..*} RechtGrundstueck;
    END berechtigtesGrundstueckRecht;

  END Eigentumsverhaeltnis;

  /** Daten, die von der amtlichen Vermessung dem Grundbuch angeboten werden. Dieses Thema beschreibt die Liegenschaften gemäss dem rechtsgültigen Zustand.
   * 
   * Beantwortete Fragen:
   * - werden die Grundbuchpläne auch geliefert (oder werden sie  irgendwo bereitgestellt, wenn ja wo)? In welchem Format?
   * Die Grundbuchpläne sind nicht Teil dieser Schnittstelle.
   * - die Grundbuchpläne als Bild sind nicht Teil der AVS. Wer erzeugt sie (Geometer oder diese Schnittstelle)?
   * Die Grundbuchpläne sind nicht Teil dieser Schnittstelle.
   */
  TOPIC Grundstuecksbeschrieb =

    CLASS AVBemerkung =
      Art : MANDATORY (
        StreitigeGrenze
        ,Lagefixpunkt
        ,Naturdenkmal
        ,eingedoltesGewaesser
        ,andere
      );
      /** falls Art==#andere
       */
      AndereArt : TEXT*20;
      Bemerkung : TEXT*200;
    END AVBemerkung;

    /** Angaben zur Bodenbedeckung.
     */
    STRUCTURE BodbdAnteil =
      /** Die Art der Bodenbedeckung, z.B. Schilfgürtel.
       * DM01: Bodenbedeckung.BoFlaeche->Art
       */
      Art : MANDATORY GB2AV.BBArt;
      /** Die Grösse der einzelnen Bodenbedeckungsfläche.
       * DM01: muss aus der Geometrie berechnet werden.
       */
      Flaechenmass : MANDATORY GB2AV.Flaeche;
      /** Die Art der Bodenbedeckung als Klartext.
       */
      ArtBezeichnung : TEXT*40;
    END BodbdAnteil;

    CLASS Gebaeude =
      /** Kein Wert vorhanden (Leer/NULL), falls kein GWR_EGID in der AV vorhanden ist, oder falls der Gebäudegrundriss (Bodenbedeckungs-/Einzelobjektfläche) in der AV mehrere GWR Gebäude representiert.
       */
      GWR_EGID : GB2AV.GWR_EGID;
      istProjektiert : MANDATORY BOOLEAN;
      istUnterirdisch : MANDATORY BOOLEAN;
      Nummer : TEXT*12;
      /** DM01OS: Gebaeudenummer->Gebaeudehauptnutzung
       */
      Gebaeudeart : TEXT*30;
      /** DM01OS: Gebaeudenummer->Nutzungscode
       * DM01FR: Code_Csol_FR
       */
      GebaeudeartCode : TEXT*4;
      Flaechenmass : MANDATORY GB2AV.Flaeche;
      Adresse : BAG {0..*} OF GB2AV.GebaeudeeingangAdresse;
    END Gebaeude;

    CLASS Grundstueck(ABSTRACT) =
      /** Die Grösse dieses Grundstücks.
       */
      Flaechenmass : GB2AV.Flaeche;
      GrundstueckArt : GB2AV.GrundstuecksArtAV;
      KantonaleUnterArt : TEXT*60;
      Gemeinde : MANDATORY GB2AV.Gemeinde;
      /** Die Nummer der letzten vollzogenen, dieses Grundstück betreffenden, Mutation.
       * Ab KS3-20050901 nicht mehr verwenden!
       */
      letzteVollzogeneMutation : GB2AV.MutationsNummer;
      /** Die Grundstücksnummer der Liegenschaft.
       */
      Nummer : MANDATORY GB2AV.GrundstueckNummer;
      /** Die Grundbuchpläne auf der die Liegenschaft liegt.
       * DM01: muss berechnet werden, durch Schnitt mit dem Thema Planeinteilung.
       */
      GBPlaene : BAG {1..*} OF GB2AV.GBPlan;
      /** Die zutreffenden Flurnamen.
       * DM01: muss berechnet werden, durch Schnitt mit Nomenklatur.Flurname
       */
      Flurnamen : BAG {0..*} OF GB2AV.Flurname;
      UNIQUE Nummer->Nummer, Nummer->NummerZusatz, Nummer->Amt, Nummer->SubKreis, Nummer->Los;

      
    END Grundstueck;

    CLASS Flaeche
    EXTENDS Grundstueck =
      MANDATORY CONSTRAINT GrundstueckArt!=#Liegenschaft;
    END Flaeche;

    /** Angaben zur rechtsgültigen Liegenschaft.
     */
    CLASS Liegenschaft
    EXTENDS Grundstueck =
      /** Die Bodenbedeckungsanteile.
       * DM01: muss berechnet werden, durch Schnitt mit Thema Bodenbedeckung
       */
      BodbdAnteil : BAG {0..*} OF BodbdAnteil;
      /** Nur ein Eintrag pro Bodenbedeckungsart.
       */
      UNIQUE (LOCAL) BodbdAnteil : Art;
      MANDATORY CONSTRAINT GrundstueckArt==#Liegenschaft;
    END Liegenschaft;

    ASSOCIATION AVBemerkungGrundstueck =
      AVBemerkung -- {0..*} AVBemerkung;
      Grundstueck -<> {1..*} Grundstueck;
    END AVBemerkungGrundstueck;

    /** Gebaeude zu allen überdeckten Liegenschaften und falls vorhanden Baurechten liefern. Der Grundbuchverwalter entscheidet selbst, bei welchem Grundstücksbeschrieb das Gebaeude eingetragen wird.
     */
    ASSOCIATION GrundstueckGebaeude =
      Gebaeude -- {0..*} Gebaeude;
      Grundstueck -<> {1..*} Grundstueck;
      Flaechenmass : MANDATORY GB2AV.Flaeche;
    END GrundstueckGebaeude;

    ASSOCIATION Anteil =
      flaeche -- {0..*} Flaeche;
      liegt_auf -- {0..*} Grundstueck;
      Flaechenmass : GB2AV.Flaeche;
    END Anteil;

  END Grundstuecksbeschrieb;

  /** Daten als Meldungen, die das Grundbuch der Amtlichen Vermessung schickt. Dieses Thema beschreibt die Informationen die vom Grundbuch als Folge einer Mutation zurück zum Geometer müssen, wie z.B. die definitiven Grundstücksnummern.
   * 
   * Beantwortete Fragen:
   * - Wie wird die Abweisung einer Mutation gemeldet?
   * Via Vollzugsgegenstand.Status==Abweisung
   */
  TOPIC Vollzugsgegenstaende =

    /** Angaben zum Vollzug einer Mutation im Grundbuch.
     */
    CLASS Vollzugsgegenstand =
      /** Aktueller Status der Mutation im Grundbuch, z.B. Eintrag.
       */
      Status : MANDATORY (
        /** Das Geschäft wurde durch den Kunden beim Grundbuchamt angemeldet.
         */
        Eingangsmeldung
        /** Das Geschäft wurde im Grundbuchamt eingetragen. Der Geometer vollzieht die Mutation definitiv.
         */
        ,Eintrag
        /** Das Geschäft wurde durch das Grundbuchamt abgewiesen. Der Geometer muss die entsprechende Mutation rückgängig machen.
         */
        ,Abweisung
      );
      /** z.B. der Grund für die Abweisung
       */
      Bemerkungen : TEXT*200;
      /** Datum des rechtsgültigen Eintrags im Grundbuch.
       */
      GrundbuchEintrag : GB2AV.Datum;
      /** Datum des Tagebucheintrags im Grundbuch
       */
      TagebuchEintrag : TEXT*20;
      /** Zusammen mit Attribut TagebuchEintrag Referenz auf das Tagebuch.
       */
      TagebuchBeleg : TEXT*20;
      /** Nummer der Mutation, die diese Vollzugsinformation betrifft.
       */
      Mutationsnummer : MANDATORY GB2AV.MutationsNummer;
    END Vollzugsgegenstand;

  END Vollzugsgegenstaende;

  TOPIC Mutationstabelle
  EXTENDS GB2AV.Grundstuecksbeschrieb =

    STRUCTURE Abschnitt =
      Flaechenmass : MANDATORY GB2AV.Flaeche;
      /** Liegenschaft, von der die Fläche abgetrennt wird.
       */
      von : MANDATORY GB2AV.GrundstueckNummer;
    END Abschnitt;

    /** Der Grundbuchverwalter kann entscheiden, ob er aus einer AV-Bemerkung nur einen, das Grundstück beschreibenden "Vermerk" (kein Tagebucheintrag erforderlich) in der Liegenschaftsbeschreibung macht, oder eine Anmerkung samt Tagebucheintrag erstellt.
     */
    CLASS AVBemerkung(EXTENDED) =
    END AVBemerkung;

    /** Angaben zu einer AV-Mutation.
     */
    CLASS AVMutation =
      /** Kommentar des Geometers zur Mutation.
       */
      Beschrieb : TEXT*50;
      /** Name der Datei mit dem Bild des Mutationsplan. Das Dateiformat ist GIF oder PDF.
       */
      DateinamePlan : TEXT*80;
      /** Datum der technischen Fertigstellung der Mutation (DM01: Liegenschaften.LSNachfuehrung->GueltigerEintrag bzw. bei alten Daten je nach Kanton Datum1 oder Datum2)
       */
      EndeTechnBereit : MANDATORY GB2AV.Datum;
      /** Hinweis das zu dieser Mutation eine Abschlussmutation erforderlich ist.
       */
      istProjektMutation : MANDATORY (
        Projekt
        ,Normal
        ,Abschluss
      );
      /** Die Nummer der Mutation. Diese wird durch den Geometer vergeben.
       */
      MutationsNummer : MANDATORY GB2AV.MutationsNummer;
      geloeschteGrundstuecke : BAG {0..*} OF GB2AV.GrundstueckNummer;
      UNIQUE MutationsNummer->Nummer, MutationsNummer->NBIdent;
    END AVMutation;

    /** Meldung für die Widerrufung einer Mutation durch den Geometer. z.B. wenn die Frist abgelaufen ist oder der Kunde das Geschäft zurückzieht.
     */
    CLASS AVMutationsAnnulation =
      /** z.B. der Grund für die Widerrufung
       */
      Bemerkungen : TEXT*200;
      /** Die Nummer der Mutation, die widerrufen wird.
       */
      MutationsNummer : MANDATORY GB2AV.MutationsNummer;
      UNIQUE MutationsNummer->Nummer, MutationsNummer->NBIdent;
    END AVMutationsAnnulation;

    CLASS Flaeche(EXTENDED) =
      /** leer wenn keine Flächekorrektur erfolgt.
       */
      Korrektur : GB2AV.FlaechenKorrektur;
      /** leer wenn keine Flächenkorrektur erfolgt. (bisherige Fläche+Koorektur==korrigiertesFlaechenmass)
       */
      korrigiertesFlaechenmass : GB2AV.Flaeche;
    END Flaeche;

    CLASS Liegenschaft(EXTENDED) =
      /** leer wenn keine Flächenkorrektur erfolgt.
       */
      Korrektur : GB2AV.FlaechenKorrektur;
      /** leer wenn keine Flächenkorrektur erfolgt. (bisherige Fläche+Koorektur==korrigiertesFlaechenmass)
       */
      korrigiertesFlaechenmass : GB2AV.Flaeche;
      /** Abschnittsfläche die der Liegenschaft hinzugefügt wird. Je nach Art der Mutation, werden keine Abschnittsflächen ausgewiesen (z.B. Neuvermessung).
       */
      Zugang : BAG {0..*} OF Abschnitt;
    END Liegenschaft;

    ASSOCIATION AVMutationBetroffeneGrundstuecke =
      /** Ein Grundstück hat keine Beziehung zu AVMutation, wenn es nicht Teil der Mutation ist, aber unter einem SDR (z.B. Baurecht) liegt, das Teil der Mutation ist.
       */
      AVMutation -<#> {0..1} AVMutation;
      betroffeneGrundstuecke -- {0..*} GB2AV.Grundstuecksbeschrieb.Grundstueck;
    END AVMutationBetroffeneGrundstuecke;

  END Mutationstabelle;

END GB2AV.
','2019-04-04 11:51:47.45');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','%ILI_FROM_DB;%XTF_DIR;http://models.interlis.ch/;%JAR_DIR');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createDatasetCols','addDatasetCol');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.0.0-SNAPSHOT-b877c2ab90c605e5848f1181c9d2edf948cbaddd');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.BasketHandling','readWrite');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO test_dataimport.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
