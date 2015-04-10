express = require 'express'
bodyParser = require 'body-parser'
methodOverride = require 'method-override'
errorHandler = require 'errorhandler'
connectAssets = require 'connect-assets'

app = module.exports = express();

# Configuration
bootstrapDir = "node_modules/bootstrap-styl/"
publicDir = "#{__dirname}/public"
assets = ["#{__dirname}/assets/css","#{__dirname}/assets/js", bootstrapDir]

app.disable('x-powered-by');
app.set "views", "#{__dirname}/views"
app.set 'view engine', 'jade'
app.set 'view options', { layout: false }

app.use bodyParser.urlencoded()
app.use bodyParser.json()
app.use methodOverride()


app.use express.static(publicDir)

if 'development' == app.get('env')
	app.use connectAssets { paths: assets }
	app.use errorHandler { dumpExceptions: true, showStack: true }


if 'production' == app.get('env')
	app.use connectAssets { paths: assets, build: true }
	app.use errorHandler()
