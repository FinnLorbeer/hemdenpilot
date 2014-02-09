class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to '/home'
      flash.now[:success] = 'Login erfolgreich - yay!.'
    else
      flash.now[:error] = 'Email und/oder Passwort sind falsch.'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
