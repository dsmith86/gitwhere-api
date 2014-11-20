require 'sinatra'
require 'sinatra_more/routing_plugin'
require 'sinatra/cross_origin'
require 'faraday-http-cache'
require 'net/http'
require 'net/https'
require 'base64'
require 'json'
require 'date'
require 'octokit'
#require 'pry'

class Application < Sinatra::Base
	register SinatraMore::RoutingPlugin
	register Sinatra::CrossOrigin

	configure do
	  enable :cross_origin
	end

	stack = Faraday::RackBuilder.new do |builder|
	  builder.use Faraday::HttpCache
	  builder.use Octokit::Response::RaiseError
	  builder.adapter Faraday.default_adapter
	end
	Octokit.middleware = stack

	@@github_client = Octokit::Client.new \
				:client_id		=> "ef687912f9c30502fb14",
				:client_secret	=> ENV['GITHUB_GITWHERE_CLIENT_SECRET']

end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'