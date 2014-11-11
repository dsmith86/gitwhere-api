class Developer
	include DataMapper::Resource

	property :id,				Serial
	property :username,	String,		:required => true
	property :name,			String
	property :avatar,		String,		:required => true

	belongs_to :location
end