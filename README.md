# ∴ electron-coffee-boilerplate

- Clone the repository
- `npm install`
- `coffee -c --bare .` to compile .coffee to .js (`--bare` to prevent wrapping in function... exports need to be at top level)
- `npm start` to build and run the electron app

## gulp tasks
- `clean` removes all .js and empties the `app` directory
- `build` assumes that coffeescript has been compiled to js; it then compiles sass to css, es6 to vanilla js, and moves all compiled files from src to app
