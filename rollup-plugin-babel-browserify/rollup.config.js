import babel from 'rollup-plugin-babel';
import preset from 'babel-preset-es2015-rollup';

export default {
    entry: '../src/src/app.js',
    plugins: [ babel({
      presets: [ preset ]
    }) ],
    format: 'iife'
};