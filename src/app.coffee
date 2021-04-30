express = require 'express'
bodyParser = require 'body-parser'
{ sysConfig } = require './config/config.default' # 配置
{ appRouters } = require './routes/router' # 路由

class App
  constructor: () ->
    console.log 'app初始化'
    @app = express()
    @middleware()
    @routes()
    @launchConf()

  middleware: () ->
    @app.use bodyParser.json()
    @app.use bodyParser.urlencoded({ extended: true })

  routes: () ->
    @app.use appRouters

  launchConf: () ->
    console.log '===================================='
    console.log '🚀  Your awesome APP is launching...'
    console.log '===================================='

    # Start Express server.
    @app.listen(sysConfig.port, () =>

      console.log '===================================='
      console.log "✅  http://#{sysConfig.host}:#{sysConfig.port}"
      console.log "✅  http://#{sysConfig.host}:#{sysConfig.port}/api-docs/swagger"
      console.log "✅  Your awesome APP launched #{@app.get('env')}"
      console.log '===================================='
    )

module.exports = new App().app
