express = require 'express'
bodyParser = require 'body-parser'
mongoose = require 'mongoose'
{ expressSwagger } = require '@lxsbw/express-swagger-ui'
swagger = require './config/swagger'
{ appRouters } = require './routes/router' # 路由
{ sysConfig, getMongoUrl } = require './config/config.default' # 配置

class App
  constructor: () ->
    console.log 'app初始化'
    @app = express()
    @middleware()
    @swaggerInit()
    @routes()
    @mongo()
    @launchConf()

  middleware: () ->
    @app.use bodyParser.json()
    @app.use bodyParser.urlencoded({ extended: true })

  routes: () ->
    @app.use appRouters

  mongo: () ->
    console.log getMongoUrl()
    mongoose.connect(getMongoUrl(), {
        useCreateIndex: true,
        poolSize: 5, # 连接池中维护的连接数
        useNewUrlParser: true,
        autoIndex: false,
        useUnifiedTopology: true
        # keepAlive: 120,
      })
      .then((open) ->
        console.log '📚  mongodb is launching...'
      )
      .catch((err) ->
        console.error.bind console, "connection error:#{err}"
      )

  swaggerInit: () ->
    @app.use swagger
    @app.use expressSwagger({
        routePrefix: '/api-docs/swagger', # host at /swagger instead of default /docs
        swaggerOptions: {
          url: '/swagger.json' # example path to json 其实就是之后swagger-jsdoc生成的文档地址
        }
      })

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
