.PHONY: babel typescript closure

typescript:
	cd typescript; npm i; npm run compile;

babel:
	cd babel; npm i; npm run compile

closure:
	cd closure; java -jar compiler.jar --language_in=ECMASCRIPT6_STRICT --js_output_file='../src/dist/bundle.js' '../src/src/**.js'

