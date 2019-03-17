[![Build Status](https://travis-ci.org/edigonzales/camel-ili2pg.svg?branch=master)](https://travis-ci.org/edigonzales/camel-ili2pg)
# camel-ili2pg
camel-ili2pg


```
mvn versions:set -DnewVersion=1.0.$TRAVIS_BUILD_NUMBER
mvn clean package
mvn --settings settings.xml -Dmaven.test.skip=true deploy
```


## Probleme:
### ili2pg 4.0.0-SNAPSHOT
Wahrscheinlich passen Maven die Plus-Zeichen nicht:

```
[WARNING] The POM for ch.interlis:iox-ili:jar:1.20.11+ is missing, no dependency information available
[WARNING] The POM for ch.interlis:ili2c-tool:jar:5.0.0+ is missing, no dependency information available
[WARNING] The POM for ch.ehi:ehisqlgen:jar:1.13.7+ is missing, no dependency information available
```
