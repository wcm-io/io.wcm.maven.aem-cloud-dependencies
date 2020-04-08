<img src="https://wcm.io/images/favicon-16@2x.png"/> wcm.io AEM Cloud Service Dependencies
======
[![Build Status](https://travis-ci.org/wcm-io/wcm-io-tooling-aem-cloud-dependencies.png?branch=develop)](https://travis-ci.org/wcm-io/wcm-io-tooling-aem-cloud-dependencies)

Maven dependencies for the AEM Cloud Service SDK

Documentation: https://wcm.io/tooling/maven/aem-dependencies.html<br/>
Issues: https://wcm-io.atlassian.net/browse/WTOOL<br/>
Wiki: https://wcm-io.atlassian.net/wiki/<br/>
Continuous Integration: https://travis-ci.org/wcm-io/wcm-io-tooling-aem-cloud-dependencies/


## Usage

This POM defines Maven dependencies for AEM Cloud Service, including those that are not defined in the `aem-sdk-api` JAR provided by Adobe. Additionally, the POM includes Sling-internal dependencies required for [AEM Mocks](https://wcm.io/testing/aem-mock/) in exactly the versions included in the AEM version.

The version number of the artifact matches with the version of the `aem-sdk-api` artifact, plus a last part (4 digits) which is the revision number added by the wcm.io project, and is incremented if a fix or update of the POM needs to be published for the same SDK API version.

To import the dependencies in your AEM project use:

[![Maven Central](https://maven-badges.herokuapp.com/maven-central/io.wcm.maven/io.wcm.maven.aem-cloud-dependencies/badge.svg)](https://maven-badges.herokuapp.com/maven-central/io.wcm.maven/io.wcm.maven.aem-cloud-dependencies)

```xml
<dependency>
  <groupId>io.wcm.maven</groupId>
  <artifactId>io.wcm.maven.aem-cloud-dependencies</artifactId>
  <version><!-- latest version, see above --></version>
  <type>pom</type>
  <scope>import</scope>
</dependency>
```



## Build from sources

If you want to build wcm.io from sources make sure you have configured all [Maven Repositories](https://wcm.io/maven.html) in your settings.xml.

See [Travis Maven settings.xml](https://github.com/wcm-io/wcm-io-tooling-aem-cloud-dependencies/blob/master/.travis.maven-settings.xml) for an example with a full configuration.

Then you can build using

```
mvn clean install
```
