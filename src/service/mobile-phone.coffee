
BaseService = require '../handle/base-service'
mobilePhoneModel = (require '../models/mobile-phone').mobilePhone

class MobilePhoneService extends BaseService
  # 查找一个
  findOne: (param) ->
    result = mobilePhoneModel
      .findOne({ _id: param._id })
      .exec()
      .then (data) ->
        return data
      .catch (err) ->
        return { state: 'Fail', mess: err }
    console.log('service result: ' + result)
    result

  # 查找
  find: (param) ->
    conditions = {}
    if param._id
      conditions = Object.assign conditions, { _id: param._id }
    if param.model_name
      conditions = Object.assign conditions, { model_name: param.model_name }

    result = await mobilePhoneModel.find conditions

  # 添加手机
  create: (param) ->
    console.log('service : ' + JSON.stringify(param))
    result = await mobilePhoneModel.create param
    console.log('service result: ' + result)
    return { _id: result._id }

  # 更新
  update: (param) ->
    console.log('service : ' + JSON.stringify(param))

    conditions = {}
    if param.model_name
      conditions = Object.assign conditions, { model_name: param.model_name }
    if param.size
      conditions = Object.assign conditions, { size: param.size }
    if param.spec
      conditions = Object.assign conditions, { spec: param.spec }
    if param.ram
      conditions = Object.assign conditions, { ram: param.ram }
    if param.rom
      conditions = Object.assign conditions, { rom: param.rom }
    if param.seria_number
      conditions = Object.assign conditions, { seria_number: param.seria_number }

    result = await mobilePhoneModel
      .updateOne({ _id: param._id }, conditions)
      .then (data) ->
        return Object.assign data, { state: 'Success' }
      .catch (err) ->
        return { state: 'Fail', mess: err }

    console.log('service result: ' + result)

    return result

  # 删除
  delete: (param) ->
    console.log('service : ' + JSON.stringify(param))

    result = await mobilePhoneModel
      .deleteOne({ _id: param._id })
      .then (data) ->
        return Object.assign data, { state: 'Success' }
      .catch (err) ->
        return { state: 'Fail', mess: err }

    console.log('service result: ' + JSON.stringify(result))

    return result

module.exports = new MobilePhoneService()
