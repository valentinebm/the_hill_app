class SessionsController < ApplicationController

  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])

      if current_reign
        previous_reign = Reign.last
        previous_reign.finished = DateTime.now
        previous_reign.save
      end

      reign = Reign.create(user_id: user.id)
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
