require 'sinatra'
require './contact.rb'

get '/' do
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/' do
  redirect :contacts
end

get '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/new' do
  erb :new
end

get '/about' do
  erb :about
end

post '/contacts' do
  Contact.create(
    first_name:  params[:first_name],
    last_name:   params[:last_name],
    email:       params[:email],
    note:        params[:note],
  )

  redirect to('/contacts')
end

after do
  ActiveRecord::Base.connection.close
end
