require 'sinatra'
require './contact.rb'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
