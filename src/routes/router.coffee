{ Router }  = require 'express'

class AppRouter

  constructor: () ->
    @appRouter = Router()
    @init()

  init: () ->
    @appRouter.get '/', (req, res) ->
      res.send 'Hello, Express CoffeeScript'


appRouters = new AppRouter().appRouter

module.exports = { appRouters }