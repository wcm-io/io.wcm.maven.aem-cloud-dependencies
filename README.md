<img src="https://wcm.io/images/favicon-16@2x.png"/> wcm.io AEM Cloud Service Dependencies
======
[![Build](https://github.com/wcm-io/io.wcm.maven.aem-cloud-dependencies/workflows/Build/badge.svg?branch=develop)](https://github.com/wcm-io/io.wcm.maven.aem-cloud-dependencies/actions?query=workflow%3ABuild+branch%3Adevelop)
[![Maven Central](https://img.shields.io/maven-central/v/io.wcm.maven/io.wcm.maven.aem-cloud-dependencies)](https://repo1.maven.org/maven2/io/wcm/maven/io.wcm.maven.aem-cloud-dependencies/)

Maven dependencies for the AEM Cloud Service SDK

Documentation: https://wcm.io/tooling/maven/aem-dependencies.html<br/>
Issues: https://github.com/wcm-io/io.wcm.maven.aem-cloud-dependencies/issues<br/>
Wiki: https://wcm-io.atlassian.net/wiki/<br/>
Continuous Integration: https://github.com/wcm-io/io.wcm.maven.aem-cloud-dependencies/actions<br/>
Commercial support: https://wcm.io/commercial-support.html


## Usage

This POM defines Maven dependencies for AEM Cloud Service, including those that are not defined in the `aem-sdk-api` JAR provided by Adobe. Additionally, the POM includes Sling-internal dependencies required for [AEM Mocks](https://wcm.io/testing/aem-mock/) in exactly the versions included in the AEM version.

The version number of the artifact matches with the version of the `aem-sdk-api` artifact, plus a last part (4 digits) which is the revision number added by the wcm.io project, and is incremented if a fix or update of the POM needs to be published for the same SDK API version.

To import the dependencies in your AEM project use:

```xml
<dependency>
  <groupId>io.wcm.maven</groupId>
  <artifactId>io.wcm.maven.aem-cloud-dependencies</artifactId>
  <version><!-- latest version, see above --></version>
  <type>pom</type>
  <scope>import</scope>
</dependency>
```

*Please note*: Since version `2024.7.17098.20240711T134106Z-240600.0000` JSONP 2.1 and Johnzon 2.x is used by default by this POM. If your code, or dependencies of your project, still rely on JSONP 1.1 and Johnzon 1.2.x, you can use the [Mixin for JSONP 1.1](https://github.com/wcm-io/io.wcm.maven.aem-cloud-dependencies-mixin-jsonp11).



## Release cycle

We do not make new releases of this dependency POM for each single AEM cloud release, but we plan to publish at least one updated version per month. If you need a new version contact us a the [mailing list](https://wcm.io/mailing-lists.html).


## update-aem-deps.groovy

The script `update-aem-deps.groovy` provides a way to update the versions in a POM in a (nearly) automatic way when a new AEM Cloud SDK version is released. Preparations to execute the script:

* Download the latest AEM SDK from https://experience.adobe.com/#/downloads/content/software-distribution/en/aemcloud.html
* Extract the Quickstart JAR and start it normally as author instance on port 4502 and wait until it's started up
* Execute `update-aem-deps.groovy`
* Pay attention on the log messages of the script. If there is any WARN or ERROR reported there is a problem which needs to be resolved manually.
* The script writes the changes directly to the POM. Inspect the changes and make sure everything is correct before committing it.

What does the script do:

* Read the AEM SDK version from the local instance
* Get the matching AEM SDK POM from Maven Central
* Read all bundle versions, package versions from local AEM instance and dependency versions from AEM SDK POM
* Update all dependencies in the POM to the versions found in the locale instance and the AEM SDK POM

As some dependencies are repackaged or embedded in other bundles there are a couple of "hints" put before the version tags in the POM that help the script to detect the right versions. The following hints are supported:

| Hint                                                                 | Description
|----------------------------------------------------------------------|---------------
| `update-aem-deps:bundle=<bundleSymbolicName>`                        | Read the bundle version from the bundle with the given symbolic name in the local AEM instance.
| `update-aem-deps:bundle-package=<packageName>`                       | Read the package version of the given package exported by any bundle in the local AEM instance.
| `update-aem-deps:derived-from=<bundleSymbolicName>:<bundleVersion>`  | The dependency is embedded in the bundle with the given symbolic name and the given version. There is no support to extract the version from this bundle, you have to do it manually. But if the targeted bundle has new version you get a warning that the bundle has changed and you have to check manually if the embedded dependency version has changed as well and update the version and the `derived-from` hint in the POM manually. It's possible to use an expression like 1.0.* to match an version numbers starting with '1.0.'.
| `update-aem-deps:from-aem-sdk-api`                                   | Read the version from the `dependencies` section of the AEM SDK API POM.
| `update-aem-deps:ignore`                                             | Ignore the dependency in the script, you have to maintain the version manually.


## Build from sources

If you want to build wcm.io from sources make sure you have configured all [Maven Repositories](https://wcm.io/maven.html) in your settings.xml.

See [Maven Settings](https://github.com/wcm-io/io.wcm.maven.aem-cloud-dependencies/blob/develop/.maven-settings.xml) for an example with a full configuration.

Then you can build using

```
mvn clean install
```
