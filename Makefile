# All: Clean, build, run test, run app
all: clean buildAll runTest runApp

# Build
buildAll: 
	javac -classpath .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar src/main/java/*.java src/test/java/*.java -d build -nowarn

# Run tests
runTest: buildAll
	java -cp .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:build org.junit.runner.JUnitCore EdgeConnectorTest

# Run program
runApp: buildAll
	java -classpath build RunEdgeConvert

# Clean .class files
clean:
	rm -f build/*.class
	find . -name \*.class -exec rm {} \;



