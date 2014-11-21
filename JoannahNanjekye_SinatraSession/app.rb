require 'sinatra'
require 'data_mapper'

#creating database
DataMapper::setup(:default,"sqlite3://#{Dir.pwd}/attendee.db")

#creating a table
class Attendee
	include DataMapper::Resource
	property:id, Serial
	property:name, Text
	property:course,Text

	DataMapper.auto_upgrade!
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


get '/new' do
	erb :new
end

post '/new' do
Attendee.create(:name => params[:name] , :course => params[:course])
redirect '/'
end

get '/attendee_list' do
	@attendees = Attendee.all 
	erb :attendee_list
end