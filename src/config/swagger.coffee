{ Router } = require 'express' # 引入路由函数
path = require 'path'
swaggerJSDoc = require 'swagger-jsdoc'
{ getApiFiles } = require './config.default' # 配置

swaggerDefinition = {
  info: {
    description: 'This is a sample server Express server.  You can find out more about     Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).      For this sample, you can use the api key `special-key` to test the authorization     filters.',
    version: '1.0.0',
    title: 'Express Swagger',
    # 服务条款
    # termsOfService: 'http://swagger.io/terms/',
    contact: {
      # name: 'Contact developers',
      # url: 'https://mail.qq.com/',
      email: 'lxsbw@outlook.com'
    },
    # 开源协议
    license: {
      name: 'Apache 2.0',
      url: 'http://www.apache.org/licenses/LICENSE-2.0.html'
    }
  },
  # host: 'localhost:4000',
  basePath: '/', # Base path (optional), host/basePath
  schemes: ['http', 'https'],
  securityDefinitions: {
    # server_auth: {
    #   type: 'oauth2',
    #   description: '登录账号密码鉴权',
    #   tokenUrl: 'http://localhost:4000/image/oauth',
    #   flow: 'password',
    #   scopes: {
    #     token: 'modify pets in your account'
    #   }
    # },
    token: {
      type: 'apiKey',
      name: 'token',
      in: 'header'
    }
  }
}

options = {
  swaggerDefinition,
  # 写有注解的router的存放地址(当你新增swagger时文档里没显示出来的话那么就是这边地址没有加进去)
  apis: ['./src/controller/*.coffee', './src/schema/request/*.coffee']
}

# development

swaggerSpec = swaggerJSDoc(options)
# 通过路由获取生成的注解文件
router = Router()
router.get '/swagger.json', (req, res) ->
  res.set('Content-Type', 'application/json')
  res.send(swaggerSpec)

module.exports = router
