#!/bin/sh
VERSION=1.0.0
JAR=target/lodmill-rd-$VERSION-jar-with-dependencies.jar
RES=src/main/resources
cd ../..
git clone git://github.com/lobid/lodmill.git lodmill-$VERSION
cd lodmill-$VERSION/lodmill-rd
git checkout tags/v$VERSION
mvn clean assembly:assembly -q --settings ../settings.xml
jar uf $JAR -C $RES flux-commands.properties
cp $JAR ../../metafacture-ide/bundles/org.culturegraph.mf.ide/
cp $JAR ../../metafacture-ide/bundles/org.culturegraph.mf.ide.tests/
