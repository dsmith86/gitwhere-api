require 'sinatra'
require 'sinatra_more/routing_plugin'
require 'net/http'
require 'net/https'
require 'base64'
require 'json'
require 'date'
require 'octokit'
#require 'pry'

class Application < Sinatra::Base
	register SinatraMore::RoutingPlugin

	before do
		content_type :json
		headers 'Access-Control-Allow-Origin' => '*',
			'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']
	end

	@@github_client = Octokit::Client.new \
				:client_id		=> "ef687912f9c30502fb14",
				:client_secret	=> ENV['GITHUB_GITWHERE_CLIENT_SECRET']

end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'