{ Router }  = require 'express'

class AppRouter

  constructor: () ->
    @appRouter = Router()
    @init()

  init: () ->
    ###
     * @swagger
     * /api/mobile-phone/findone:
     *   get:
     *     summary: id查找
     *     description: id查找
     *     tags: [MobilePhone]
     *     deprecated: false
     *     parameters:
     *     - in: "query"
     *       name: "_id"
     *       type: "string"
     *       required: true
     *       description: "id"
     *     responses:
     *       '200':
     *         description: OK
    ###
    @appRouter.get '/api', (req, res) ->
      res.send 'Hello, Express CoffeeScript'

    @appRouter.get '/', (req, res) ->
      res.send 'Hello, Express CoffeeScript'


appRouters = new AppRouter().appRouter

module.exports = { appRouters }