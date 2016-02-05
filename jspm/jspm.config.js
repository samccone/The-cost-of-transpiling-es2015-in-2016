SystemJS.config({
  packageConfigPaths: [
    "npm:@*/*.json",
    "npm:*.json"
  ],
  globalEvaluationScope: false,
  transpiler: "plugin-babel",
  sourceMaps: false,

  map: {
    "plugin-babel": "npm:systemjs-plugin-babel@0.0.2"
  },

  packages: {
    "src": {
      "defaultExtension": "js"
    }
  }
});
