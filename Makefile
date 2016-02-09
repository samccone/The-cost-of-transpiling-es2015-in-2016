.PHONY: babel typescript closure rollup traceur size rollup-plugin-babel webpack babelify jspm webpack-2 typescript-webpack

# local binary paths
browserify = node ./node_modules/browserify/bin/cmd.js
uglifyjs = node ./node_modules/uglify-js/bin/uglifyjs
babel = node ./node_modules/babel-cli/bin/babel.js
traceur = node node_modules/traceur/bin/traceur.js
tsc = node node_modules/typescript/bin/tsc
rollup = node node_modules/rollup/bin/rollup
jspm = node node_modules/jspm/jspm.js
webpack = node node_modules/webpack/bin/webpack.js

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
	cd typescript; npm i;
	cd typescript; time $(tsc) && $(browserify) -p bundle-collapser/plugin ./dist/*.js | $(uglifyjs) --compress --mangle - > ../src/dist/bundle.js

babel:
	cd babel; npm i;
	cd babel; time $(babel) ../src/src --presets ./node_modules/babel-preset-es2015 --out-dir dist && $(browserify) -p bundle-collapser/plugin dist/app.js | $(uglifyjs) --compress --mangle - > ../src/dist/bundle.js

babelify:
	cd babelify; npm i;
	cd babelify; time $(browserify) ../src/src/app.js -t [ babelify --presets [ ./node_modules/babel-preset-es2015 ] ] -p bundle-collapser/plugin | $(uglifyjs) --compress --mangle - > ../src/dist/bundle.js

rollup:
	cd rollup; npm i;
	cd rollup; time $(rollup) --format iife -- ../src/src/app.js | $(babel) --presets ./node_modules/babel-preset-es2015 | $(uglifyjs) --compress --mangle - > ../src/dist/bundle.js

rollup-plugin-babel:
	cd rollup-plugin-babel; npm i;
	cd rollup-plugin-babel; time $(rollup) -c | $(uglifyjs) --compress --mangle - > ../src/dist/bundle.js

closure:
	cd closure; time java -jar compiler.jar --compilation_level ADVANCED_OPTIMIZATIONS --language_in=ECMASCRIPT6_STRICT --js_output_file='../src/dist/bundle.js' '../src/src/**.js'

traceur:
	cd traceur; npm i;
	cd traceur; time $(traceur) --modules=commonjs --dir ../src/src/ tmp/ && (cat node_modules/traceur/bin/traceur-runtime.js; $(browserify) -p bundle-collapser/plugin tmp/app.js;) | $(uglifyjs) --compress --mangle - > ../src/dist/bundle.js

webpack:
	cd webpack; npm i;
	cd webpack; time $(webpack) ../src/src/app.js ../src/dist/bundle.js

jspm:
	cd jspm; npm i;
	cd jspm; time $(jspm) build src/app.js ../src/dist/bundle.js --skip-source-maps --minify --format global --global-name app

webpack-2:
	cd webpack-2; npm i;
	cd webpack-2; time $(webpack) ../src/src/app.js ../src/dist/bundle.js

typescript-webpack:
	cd typescript-webpack; npm i;
	cd typescript-webpack; time $(tsc) && $(webpack) ./dist/app.js ../src/dist/bundle.js -p

size:
	@echo -----------------------------------------
	cat src/dist/bundle.js | wc -c
	gzip -c src/dist/bundle.js | wc -c
	bro --input src/dist/bundle.js | wc -c
	@echo -----------------------------------------
