class SessionsController < ApplicationController

  get '/sessions/login' do

    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/home'
    else
      redirect '/sessions/login'
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

end
