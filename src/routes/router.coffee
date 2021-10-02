{ Router }  = require 'express'
MobilePhone = require '../controller/mobile-phone'

class AppRouter
  constructor: () ->
    @appRouter = Router()
    @init()

  init: () ->
    @appRouter.get '/api/mobile-phone/findone/:_id', MobilePhone.findOne
    @appRouter.get '/api/mobile-phone/findall', MobilePhone.findall
    @appRouter.post '/api/mobile-phone/create', MobilePhone.create
    @appRouter.put '/api/mobile-phone/update', MobilePhone.update
    @appRouter.patch '/api/mobile-phone/patch', MobilePhone.updateByPatch
    @appRouter.delete '/api/mobile-phone/delete', MobilePhone.delete
    @appRouter.get '/api/hello', MobilePhone.hello

    @appRouter.get '/', (req, res) ->
      res.send 'Hello, Express CoffeeScript!'


appRouters = new AppRouter().appRouter

module.exports = { appRouters }
