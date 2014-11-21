require 'sinatra'
require 'data_mapper'

#creating database
DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/attendee.db")

#creating a table
class Attendee
	include DataMapper::Resource
	property: id, Serial
	property: name, Text
	property: corse,Text

	DataMapper.finalize.auto_upgrade!
end


#static files
get '/' do
	erb :index 
end

get '/about' do
	erb :about 
end

get '/contact' do 

	erb :contact
end