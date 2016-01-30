.PHONY: babel typescript closure rollup size

all:
	make typescript
	make size
	make babel
	make size
	make rollup
	make size
	make closure
	make size

typescript:
	cd typescript; npm i; npm run compile;

babel:
	cd babel; npm i; npm run compile

rollup:
	cd rollup; npm i; npm run compile

closure:
	cd closure; java -jar compiler.jar --language_in=ECMASCRIPT6_STRICT --js_output_file='../src/dist/bundle.js' '../src/src/**.js'

size:
	stat -f%z src/dist/bundle.js
