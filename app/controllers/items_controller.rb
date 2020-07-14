class ItemsController < ApplicationController 
get '/items' do
    @item = current_user.items
    erb :'items/index'
end

get '/items/new' do
    @item = Item.new
    erb :'items/new'
end

post '/items' do
    @item = current_user.items.build(params[:item])
    if @item.save
        redirect '/items'
    else
        flash.now[:error] = @item.errors.full_messages
        erb :'items/new'
    end
end

get '/items/:id/edit' do
    set_item
    if current_user == @item.user
    erb :'items/edit'
    else
        redirect '/items'
    end
end

get '/items/:id' do
    set_item
    if @item
    erb :'items/show'
    else
        redirect '/items'
    end
end

patch '/items/:id' do
    set_item
    if current_user == @item.user && @item.update(
        name: params[:item][:name], 
        description: params[:item][:description]
    )
    redirect "/items/#{@item.id}"
    else
        erb :'/items/edit'
    end
end

delete '/items/:id' do
    set_item
    if current_user ==@item.user
    @item.destroy
    else
    redirect '/items'
    end
end

private
def set_item
    @item = Item.find_by_id(params[:id])
end

end