require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, ENV['GITWHERE_DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper::Model.raise_on_save_failure = false

# Models go here
require_relative 'developer'
require_relative 'location'

DataMapper.finalize
DataMapper.auto_upgrade!