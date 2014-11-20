class Developer
	include DataMapper::Resource

	# Unless otherwise specified, a String property length defaults to 50
	property :username,		String,		:key => true, :required => true, :unique => true
	property :avatar,			String,		:required => true, :length => 60
	property :url, 				String,		:required => true

	property :name,				String
	property :website,		String
	property :email,			String
	property :repo_count,	Integer
	property :gist_count, Integer
	property :followers,	Integer
	property :following,	Integer

	property :detailed,		Boolean

	belongs_to :location
end