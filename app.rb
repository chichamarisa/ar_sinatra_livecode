require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"


require "byebug"

# X As a user I can list all the restaurants
# X As a user I can see one restaurant's details
# X As a user I can add a restaurant

# A restaurant has a name and a city

get "/" do
  @restaurants = Restaurant.order(created_at: :desc)

  erb :index
end

# restos.org/restaurants/2
get "/restaurants/:id" do
  resto_id = params["id"].to_i
  @resto = Restaurant.find(resto_id)

  erb :show
end

post "/" do
  resto_name = params["resto_name"]
  resto_city = params["resto_city"]

  resto = Restaurant.new(name: resto_name, city: resto_city)
  resto.save

  redirect "/"
end

# URL for the boilerplate of activerecord + sinatra:
# https://github.com/lewagon/activerecord-sinatra-boilerplate

# HTTP, GET vs POST
# HTTP request:
# - GET (to get the data)
# - POST (to create/add some data)
# - PUT/PATCH (to update)
# - DELETE (to delete)
# This is the REST architectural style, used a lot in web applications and API.
# Apps following the mapping between CRUD operations in the DB and
# POST GET PATCH DELETE http verbs to trigger those are said to be RESTful.

# Until now, we've seen GET request -> Classic
# http request (the one we use when we visit a URL in our browser).
# GET requests include all required data in the URL.
# But when we use a form (tweet on twitter, post on facebook...), we actually
# make a POST request.
# We use POST requests cause they have a body (can carry a hash of information)















