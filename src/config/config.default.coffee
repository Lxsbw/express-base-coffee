config = exports? and exports
# config = (typeof exports !== "undefined" && exports !== null) && exports;

config.sysConfig = {
  host: 'localhost'
  port: 8001
}

mongoConf = {
  user: 'test_user',
  pass: '123456',
  host: '121.37.188.31',
  port: '16380',
  db: 'testdb'
}

config.getMongoUrl = () ->
  mongoUrl = 'mongodb://'
  dbName = mongoConf.db
  mongoUrl += "#{mongoConf.user}:#{mongoConf.pass}@#{mongoConf.host}:#{mongoConf.port}"
  mongoUrl += "/#{dbName}"

apicoffeeFiles = [
    './src/controller'
    './src/schema/request'
  ]

apiJSFiles = [
    './dist/controller'
    './dist/schema/request'
  ]

getCoffeeFiles = () ->
  apicoffeeFiles.map (m) -> "#{m}/*.coffee"

getJSFiles = () ->
  apiJSFiles.map (m) -> "#{m}/*.js"

config.getApiFiles = () ->
  files = [].concat getCoffeeFiles(), getJSFiles()
  # files = getJSFiles()
  # console.log 'files:', files
  # files

config.getApiPath = () ->
  apiJSFiles
