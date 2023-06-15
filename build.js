const { build } = require('esbuild');

build({
  entryPoints: ['app/javascript/index.js'], // Update this path if necessary
  bundle: true,
  sourcemap: true,
  outdir: 'app/assets/builds',
  publicPath: 'assets',
}).catch(() => process.exit(1));
