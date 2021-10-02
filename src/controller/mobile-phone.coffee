BaseController = require '../handle/base-controller'
MobilePhoneService = require '../service/mobile-phone'

class MobilePhoneController extends BaseController
  ###
   * @swagger
   * /api/mobile-phone/findone/{_id}:
   *   get:
   *     summary: id查找
   *     description: id查找
   *     tags: [MobilePhone]
   *     deprecated: false
   *     parameters:
   *     - in: "path"
   *       name: "_id"
   *       type: "string"
   *       required: true
   *       description: "id"
   *     responses:
   *       '200':
   *         description: OK
  ###
  findOne: (req, res, next) ->
    console.log('controller : ', JSON.stringify(req.params))
    res.json(await MobilePhoneService.findOne { _id: req.params._id })

  ###
   * @swagger
   * /api/mobile-phone/findall:
   *   get:
   *     summary: 查找
   *     description: 查找
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "query"
   *       name: "_id"
   *       type: "string"
   *       description: "id"
   *     - in: "query"
   *       name: "model_name"
   *       type: "string"
   *       description: "手机型号"
   *     responses:
   *       '200':
   *         description: OK
  ###
  findall: (req, res, next) ->
    res.json(await MobilePhoneService.find({
      _id: req.query._id,
      model_name: req.query.model_name
    }))

  ###
   * @swagger
   * /api/mobile-phone/create: # 接口地址
   *   post: # 请求体
   *     summary: 添加手机
   *     description: 添加手机 # 接口信息
   *     tags: [MobilePhone] # 模块名称
   *     parameters: # 请求参数
   *     - in: "body"
   *       name: "MobilePhone"
   *       description: "手机信息"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhone"
   *     responses:
   *       '200':
   *         description: OK
  ###
  create: (req, res, next) ->
    console.log('controller : ', JSON.stringify(req.body))
    res.json(await MobilePhoneService.create req.body)

  ###
   * @swagger
   * /api/mobile-phone/update:
   *   put:
   *     summary: 更新手机
   *     description: 更新手机
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "body"
   *       name: "MobilePhoneUpd"
   *       description: "手机信息"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhoneUpd"
   *     responses:
   *       '200':
   *         description: OK
  ###
  update: (req, res, next) ->
    console.log('controller : ', JSON.stringify(req.body))
    res.json(await MobilePhoneService.update req.body)

  ###
   * @swagger
   * /api/mobile-phone/patch:
   *   patch:
   *     summary: 更新手机
   *     description: 更新手机
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "body"
   *       name: "MobilePhoneUpdPatch"
   *       description: "手机信息"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhoneUpdPatch"
   *     responses:
   *       '200':
   *         description: OK
  ###
  updateByPatch: (req, res, next) ->
    console.log('controller : ', JSON.stringify(req.body))
    res.json(await MobilePhoneService.update req.body)

  ###
   * @swagger
   * /api/mobile-phone/delete:
   *   delete:
   *     summary: 删除手机
   *     description: 删除手机
   *     tags: [MobilePhone]
   *     parameters:
   *     - in: "body"
   *       name: "MobilePhoneDel"
   *       description: "手机id"
   *       required: true
   *       schema:
   *         $ref: "#/definitions/MobilePhoneDel"
   *     responses:
   *       '200':
   *         description: OK
  ###
  delete: (req, res, next) ->
    console.log('controller : ', JSON.stringify(req.body))
    res.json(await MobilePhoneService.delete req.body)

  ###
   * @swagger
   * /api/hello:
   *   get:
   *     summary: env Test
   *     description: env Test
   *     tags: [Default]
   *     deprecated: false
   *     responses:
   *       '200':
   *         description: OK
  ###
  hello: (req, res, next) ->
    res.json({ APPenv: APP.get('env'), Nenv: process.env.NODE_ENV, Penv: process.env })

module.exports = new MobilePhoneController()
