class SessionsController < ApplicationController
  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to root_url
    else
      user = User.find_by_email(params[:email])
      user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
