.PHONY: babel typescript

typescript:
	cd typescript; npm i; npm run compile; curl https://raw.githubusercontent.com/jrburke/almond/latest/almond.js > ../src/dist/bundle.js; cat ../src/dist/tmp.js >> ../src/dist/bundle.js; echo 'require(["app"], function(){})' >> ../src/dist/bundle.js

babel:
	cd babel; npm i; npm run compile
