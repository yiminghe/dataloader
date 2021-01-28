
# Build before publishing
npm run build;

# Ensure a vanilla package.json before deploying so other tools do not interpret
# The built output as requiring any further transformation.
node -e "var package = require('./package.json'); \
  delete package.scripts; \
  delete package.devDependencies; \
  require('fs').writeFileSync('dist/package.json', JSON.stringify(package, null, 2));"
