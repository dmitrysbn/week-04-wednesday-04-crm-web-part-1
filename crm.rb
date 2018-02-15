require 'sinatra'
require './contact.rb'

get '/' do
  erb :index
end
