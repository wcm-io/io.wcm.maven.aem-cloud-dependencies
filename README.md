<img src="https://wcm.io/images/favicon-16@2x.png"/> wcm.io Tooling
======
[![Build Status](https://travis-ci.org/wcm-io/wcm-io-tooling-aem-cloud-dependencies.png?branch=develop)](https://travis-ci.org/wcm-io/wcm-io-tooling-aem-cloud-dependencies)

Defines Maven dependencies for the current AEM Cloud Service, including those that are not defined in the aem-sdk-api JAR provided by Adobe.

Documentation: https://wcm.io/tooling/<br/>
Issues: https://wcm-io.atlassian.net/browse/WTOOL<br/>
Wiki: https://wcm-io.atlassian.net/wiki/<br/>
Continuous Integration: https://travis-ci.org/wcm-io/wcm-io-tooling-aem-cloud-dependencies/


## Build from sources

If you want to build wcm.io from sources make sure you have configured all [Maven Repositories](https://wcm.io/maven.html) in your settings.xml.

See [Travis Maven settings.xml](https://github.com/wcm-io/wcm-io-tooling-aem-cloud-dependencies/blob/master/.travis.maven-settings.xml) for an example with a full configuration.

Then you can build using

```
mvn clean install
```
