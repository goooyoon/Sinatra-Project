class UsersController < ApplicationController
  use Rack::Flash

    get '/signup' do
      erb :'users/new'
    end
  
    post '/signup' do
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        redirect '/items'
      else
        flash.now[:error] = @user.errors.full_messages
        erb :'users/new'
      end
    end
  end