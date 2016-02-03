.PHONY: babel typescript closure rollup traceur size rollup-plugin-babel webpack babelify jspm webpack-2

all:
	make typescript
	make size
	make babel
	make size
	make babelify
	make size
	make rollup-plugin-babel
	make size
	make rollup
	make size
	make closure
	make size
	make traceur
	make size
	make webpack
	make size
	make jspm
	make size
	make webpack-2
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

closure:
	cd closure; java -jar compiler.jar --compilation_level ADVANCED_OPTIMIZATIONS --language_in=ECMASCRIPT6_STRICT --js_output_file='../src/dist/bundle.js' '../src/src/**.js'

traceur:
	cd traceur; npm i; npm run compile

webpack:
	cd webpack; npm i; npm run compile

jspm:
	cd jspm; npm i; npm run compile

webpack-2:
	cd webpack-2; npm i; npm run compile

size:
	@echo -----------------------------------------
	stat -f%z src/dist/bundle.js
	gzip -c src/dist/bundle.js | wc -c
	bro --input src/dist/bundle.js | wc -c
	@echo -----------------------------------------
