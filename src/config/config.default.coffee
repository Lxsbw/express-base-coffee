config = exports? and exports
# config = (typeof exports !== "undefined" && exports !== null) && exports;

config.sysConfig = {
  host: 'localhost'
  port: 8001
}

config.env = {
  DEBUG: true,
  ENV: ''
}

mongoConf = {
  user: 'test_user',
  pass: '123456',
  host: '10.211.55.58',
  port: '16380',
  db: 'testdb'
}

config.getMongoUrl = () ->
  mongoUrl = 'mongodb://'
  dbName = mongoConf.db
  mongoUrl += "#{mongoConf.user}:#{mongoConf.pass}@#{mongoConf.host}:#{mongoConf.port}"
  mongoUrl += "/#{dbName}"

apiCoffeeFiles = ['./src/controller', './src/schema/request']
apiJSFiles = ['./dist/controller', './dist/schema/request']

config.getApiFiles = () ->
  if process.env.NODE_ENV is 'development'
    files =  apiCoffeeFiles.map (m) -> "#{m}/*.coffee"
  else
    files =  apiJSFiles.map (m) -> "#{m}/*.js"
  # console.log 'files:', files
  files

config.getApiPath = () ->
  apiJSFiles
