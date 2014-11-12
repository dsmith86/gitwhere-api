class Developer
	include DataMapper::Resource

	property :id,					Serial

	# Unless otherwise specified, a String property length defaults to 50
	property :username,		String,		:required => true, :unique => true
	property :avatar,			String,		:required => true, :length => 60
	property :url, 				String,		:required => true

	property :name,				String
	property :followers,	Integer
	property :following,	Integer
	property :repo_count,	Integer

	property :etag,				String

	belongs_to :location
end