class ItemsController < ApplicationController 
get '/items' do
    erb :'items/index'
end

get '/items/new' do
    erb :'items/new'
end

post '/items' do
    item = Item.new(params[:item])
    if item.save
        redirect '/items'
    else
        erb :'items/new'
    end
end

get '/items/:id' do
    # binding.pry
    erb :'items/show'
end

end