sysConfig = {
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

getMongoUrl = () ->
  mongoUrl = 'mongodb://'
  dbName = mongoConf.db
  mongoUrl += "#{mongoConf.user}:#{mongoConf.pass}@#{mongoConf.host}:#{mongoConf.port}"
  mongoUrl += "/#{dbName}"

module.exports = { sysConfig, getMongoUrl }