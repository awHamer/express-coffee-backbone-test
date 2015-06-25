express = require 'express'
swig = require('swig')
fs = require 'fs'
Router = require './router.coffee'

app = express()
port = 3000

app.engine 'html', swig.renderFile
app.set('view engine', 'html');
app.set 'views', __dirname + '/views'
app.use express.static __dirname + '/../public'
app.listen port
console.log 'app started on port 3000'

new Router app
