# ∴

'use strict'

path = require('path')
jetpack = require('fs-jetpack')
rollup = require('rollup').rollup
nodeBuiltInModules = [
  'assert'
  'buffer'
  'child_process'
  'cluster'
  'console'
  'constants'
  'crypto'
  'dgram'
  'dns'
  'domain'
  'events'
  'fs'
  'http'
  'https'
  'module'
  'net'
  'os'
  'path'
  'process'
  'punycode'
  'querystring'
  'readline'
  'repl'
  'stream'
  'string_decoder'
  'timers'
  'tls'
  'tty'
  'url'
  'util'
  'v8'
  'vm'
  'zlib'
]
electronBuiltInModules = [ 'electron' ]

generateExternalModulesList = ->
  appManifest = jetpack.read('./package.json', 'json')
  [].concat nodeBuiltInModules, electronBuiltInModules, Object.keys(appManifest.dependencies), Object.keys(appManifest.devDependencies)

cached = {}

module.exports = (src, dest, opts) ->
  opts = opts or {}
  opts.rollupPlugins = opts.rollupPlugins or []
  rollup(
    entry: src
    external: generateExternalModulesList()
    cache: cached[src]
    plugins: opts.rollupPlugins).then (bundle) ->
    cached[src] = bundle
    jsFile = path.basename(dest)
    result = bundle.generate(
      format: 'cjs'
      sourceMap: true
      sourceMapFile: jsFile)
    isolatedCode = '(function () {' + result.code + '\n}());'
    Promise.all [
      jetpack.writeAsync(dest, isolatedCode + '\n//# sourceMappingURL=' + jsFile + '.map')
      jetpack.writeAsync(dest + '.map', result.map.toString())
    ]