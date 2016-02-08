.PHONY: babel typescript closure rollup traceur size rollup-plugin-babel webpack babelify jspm webpack-2 typescript-webpack

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
	make typescript-webpack
	make size

typescript:
	cd typescript; npm i; time npm run compile;

babel:
	cd babel; npm i; time npm run compile

babelify:
	cd babelify; npm i; time npm run compile

rollup:
	cd rollup; npm i; time npm run compile

rollup-plugin-babel:
	cd rollup-plugin-babel; npm i; time npm run compile

closure:
	cd closure; time java -jar compiler.jar --compilation_level ADVANCED_OPTIMIZATIONS --language_in=ECMASCRIPT6_STRICT --js_output_file='../src/dist/bundle.js' '../src/src/**.js'

traceur:
	cd traceur; npm i; time npm run compile

webpack:
	cd webpack; npm i; time npm run compile

jspm:
	cd jspm; npm i; time npm run compile

webpack-2:
	cd webpack-2; npm i; time npm run compile

typescript-webpack:
	cd typescript-webpack; npm i; time npm run compile

size:
	@echo -----------------------------------------
	stat -f%z src/dist/bundle.js
	gzip -c src/dist/bundle.js | wc -c
	bro --input src/dist/bundle.js | wc -c
	@echo -----------------------------------------
