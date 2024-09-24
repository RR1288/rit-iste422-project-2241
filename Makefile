# All: Clean, build, run test, run app
all: clean buildAll runTest runApp

# Build

buildMain: 
	javac -classpath .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar src/main/java/*.java -d build/classes/java/main -nowarn

buildTest:
	javac -classpath .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:build/classes/java/main src/test/java/*.java -d build/classes/java/test -nowarn

buildAll: buildMain buildTest

# Run tests
runTest: buildAll
	java -cp .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:build/classes/java/main:build/classes/java/test org.junit.runner.JUnitCore EdgeConnectorTest

# Run program
runApp: buildAll
	java -classpath build/classes/java/main RunEdgeConvert

# Clean .class files
clean:
	rm -f build/*.class
	find . -name \*.class -exec rm {} \;



