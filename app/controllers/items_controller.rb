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

get '/items/:id/edit' do
    erb :'items/edit'
end

get '/items/:id' do
    # @item = Item.find_by_id(params[:id])
    if @item
    erb :'items/show'
    else
        redirect '/items'
    end
end

patch '/items/:id' do
    set_item
    if @item.update(
        name: params[:item][:name], 
        description: params[:description]
    )
    redirect "/items/#{@item.id}"
    else
        erb :'/items/edit'
    end
end

delete '/items/:id' do
    set_item
    @item.destroy
    redirect '/items'
end

private
def set_item
    @item = Item.find_by_id(params[:id])
end

end