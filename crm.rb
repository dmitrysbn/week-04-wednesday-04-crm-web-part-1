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

### Add contact ###
post '/contacts' do
  Contact.create(
    first_name:  params[:first_name],
    last_name:   params[:last_name],
    email:       params[:email],
    note:        params[:note],
  )

  redirect to('/contacts')
end

### Edit contact ###
get '/contacts/:id/edit' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.update(
      first_name: params[:first_name],
      last_name:  params[:last_name],
      email:      params[:email],
      note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end



after do
  ActiveRecord::Base.connection.close
end
