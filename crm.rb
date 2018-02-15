require 'sinatra'
require './contact.rb'

get '/' do
  erb :index
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :show_contact
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
