
# Overview #

Project to manage Liquibase library for tracking, managing and applying database schema changes.

## Tree ##

bin/ all Liquibase bin
conf/
  |  liquibase.properties  database access config file
 workdir
  |  webapp-1.0  Project folder
  		|  releasechanges.xml  repository for all revision
  		|  rev_127.xml         revision file
   master.xml   Master file for launching all migration file
start.sh   launcher script

## Requirements ##

The following is how to setup the env to run the db migrations:
* Install java

## Configuration ##

Add your database information

```SHELL
#liquibase.properties
driver: com.mysql.jdbc.Driver
url: jdbc:mysql://127.0.0.1/hello
username: login
password: password
```

## Usage ##

```SHELL
root@localhost:# ./start workdir/master.xml
```
## Xml files ##

### Master file 
* Here you will insert all releasechange for each project

```XML
<?xml version="1.0" encoding="UTF-8"?>
<databaseChangeLog
	xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
						http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd">
        <include file="workdir/webapp-1.0/releasechanges.xml"/>
</databaseChangeLog>
```

### all revision file 
* Here you will insert all releasechange for each project
```XML
<?xml version="1.0" encoding="UTF-8"?> 
<databaseChangeLog
	xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
		http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd">
  <include relativeToChangelogFile="true" file="rev_127.xml"/>
</databaseChangeLog> 
```


### revision file example

```XML
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-2.0.xsd">			
	<changeSet author="" id="rev_127">
        <createTable tableName="accounting">
            <column autoIncrement="true" name="id_accounting" type="INT">
                <constraints nullable="false" primaryKey="true"/>
            </column>
            <column name="id_customer" type="INT UNSIGNED">
                <constraints nullable="false"/>
            </column>
            <column name="email_sent" type="BIGINT">
                <constraints nullable="false"/>
            </column>
            <column name="amount" type="BIGINT">
                <constraints nullable="false"/>
            </column>
            <column name="cost" type="INT">
                <constraints nullable="false"/>
            </column>
            <column name="currency" type="enum('AED','AFN','ALL','AMD','ANG','AOA','ARS','AUD','AWG','AZN','BAM','BBD','BDT','BGN','BHD','BIE','BIF','BMD','BND','BOB','BOV','BRL','BSD','BTN','BWP','BYR','BZD','CAD','CDF','CHE','CHF','CHW','CLF','CLP','CNY','COP','COU','CRC','CUP','CVE','CZK','DJF','DKK','DOP','DZD','EEK','EGP','ERN','ETB','EUR','FJD','FKP','GBP','GEL','GHS','GIP','GMD','GNF','GTQ','GWP','GYD','HKD','HNL','HRK','HTG','HUF','IDR','ILS','INR','IQD','IRR','ISK','JMD','JOD','JPY','KES','KGS','KHR','KMF','KPW','KRW','KWD','KYD','KZT','LAK','LBP','LKR','LRD','LSL','LTL','LVL','LYD','MAD','MDL','MGA','MKD','MMK','MNT','MOP','MRO','MUR','MVR','MWK','MXN','MXV','MYR','MZN','NAD','NGN','NIO','NOK','NPR','NZD','OMR','PAB','PEN','PGK','PHP','PKR','PLN','PYG','QAR','RON','RSD','RUB','RWF','SAR','SBD','SCR','SDG','SEK','SGD','SHP','SKK','SLL','SOS','SRD','STD','SYP','SZL','THB','TJS','TMM','TND','TOP','TRY','TTD','TWD','TZS','UAH','UGX','USD','UYI','UYU','UZS','VEF','VND','VUV','WST','XAF','XCD','XDR','XOF','XPF','YER','YTL','ZAR','ZWR')">
                <constraints nullable="false"/>
            </column>
            <column name="date" type="DATETIME">
                <constraints nullable="false"/>
            </column>
        </createTable>
    </changeSet>
</databaseChangeLog>
```