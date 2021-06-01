fs = require 'fs'
path = require 'path'
{ getApiPath } = require '../config/config.default' # 配置

## 方法作用
## 将编译后的js文件 -> 生成的注释/*替换成/**，即能解析成swagger document
apiHandle = () ->

  paths = getApiPath()

  for ph in paths
    filePath = path.resolve(ph)  # 要遍历的文件夹
    files = fs.readdirSync(filePath) # 读取文件列表

    for file in files # 遍历文件列表
      localdir = path.join(filePath, file) # 获取文件的本地路径
      # fileType = fs.statSync(localdir) # 读取文件信息，可用于判断文件类型等

      jsfile = fs.readFileSync(localdir, 'utf8') # 读取文件内容
      jsfile = jsfile.replace(new RegExp('\\/\\*', 'g'), '/**') # 将/*替换成/**

      fs.writeFileSync(localdir, jsfile, 'utf8') # 回写覆盖文件

apiHandle()
