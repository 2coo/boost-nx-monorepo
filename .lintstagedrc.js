module.exports = {
  // Type check TypeScript files
  '**/*.(ts|tsx)': () => 'nx affected --target tsc',

  // Run test
  '**/*.spec.(ts|tsx)': () => 'nx affected --target test --uncommitted',

  // Lint & Prettify TS and JS files
  '**/*.(ts|tsx|js)': () => [
    `nx affected --target lint --uncommitted --fix true`,
    `nx format:write --uncommitted`
  ],

  // Prettify only Markdown and JSON files
  '**/*.(md|json)': () => `nx format:write --uncommitted`
}
