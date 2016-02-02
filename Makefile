.PHONY: babel typescript closure rollup traceur size rollup-plugin-babel rollup-plugin-babel-browserify webpack babelify

all:
	make typescript
	make size
	make babel
	make size
	make babelify
	make size
	make rollup-plugin-babel
	make rollup-plugin-babel-browserify
	make size
	make rollup
	make size
	make closure
	make size
	make traceur
	make size
	make webpack
	make size

typescript:
	cd typescript; npm i; npm run compile;

babel:
	cd babel; npm i; npm run compile

babelify:
	cd babelify; npm i; npm run compile

rollup:
	cd rollup; npm i; npm run compile

rollup-plugin-babel:
	cd rollup-plugin-babel; npm i; npm run compile

rollup-plugin-babel-browserify:
	cd rollup-plugin-babel-browserify; npm i; npm run compile

closure:
	cd closure; java -jar compiler.jar --language_in=ECMASCRIPT6_STRICT --js_output_file='../src/dist/bundle.js' '../src/src/**.js'

traceur:
	cd traceur; npm i; npm run compile

webpack:
	cd webpack; npm i; npm run compile

size:
	@echo -----------------------------------------
	stat -f%z src/dist/bundle.js
	gzip -c src/dist/bundle.js | wc -c
	@echo -----------------------------------------

