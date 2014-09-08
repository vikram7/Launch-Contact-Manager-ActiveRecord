require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'

require_relative 'models/contact'

get '/' do
  @contacts = Contact.all
  erb :index
end

get '/contacts/:id' do
  @contact_on_id  = Contact.find(params[:id])
  erb :show
end

get '/add_contact' do
  erb :add_contact
end

post '/add_contact' do
  Contact.create(first_name: params[:first_name], last_name: params[:last_name], phone_number: params[:phone_number])
  redirect '/'
end

post '/search' do
  @search_string = params[:search_string]
  @contacts = Contact.where("first_name ILIKE '%#{@search_string}' OR last_name ILIKE '%#{@search_string}'")
  erb :index
end
