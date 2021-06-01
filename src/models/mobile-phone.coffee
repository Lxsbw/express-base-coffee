mongoose = require 'mongoose'

mobilePhoneSchema = new mongoose.Schema(
  {
    model_name: { type: String },
    size: { type: String },
    spec: { type: String },
    ram: { type: Number },
    rom: { type: Number },
    seria_number: { type: String },
    deleted: { type: Boolean, default: false }
  },
  {
    versionKey: false,
    timestamps: { createdAt: 'created', updatedAt: 'updated' },
    runSettersOnQuery: true # 查询时是否执行 setters
  }
)

console.log '实体类mobilePhone:', new Date().getTime()
mobilePhone = mongoose.model 'mobilePhone', mobilePhoneSchema, 'mobile-phone'

module.exports = { mobilePhone }
