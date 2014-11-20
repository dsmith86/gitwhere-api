class Location
	include DataMapper::Resource

	property :id,				Serial
	property :location,	String,		:required => true

	has n, :developers
end