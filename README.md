# ∴ electron-coffee-boilerplate

- `coffee -c --bare .` to compile .coffee to .js (`--bare` to prevent wrapping in function... exports need to be at top level)
- `npm start` to build and run the electron app

## gulp tasks
- `clean` removes all .js and empties the `app` directory
- `build` assumes that coffeescript has been compiled to vanilla JS; it compiles sass to css, es6 to vanilla js, and moves all compiled files from src to app
