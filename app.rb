require 'sinatra'
require 'sinatra_more/routing_plugin'
require 'net/http'
require 'net/https'
require 'httparty'
require 'base64'
require 'json'
require 'date'

class Application < Sinatra::Base
	register SinatraMore::RoutingPlugin

	get '/' do
		'Hello, World!'
	end

end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'