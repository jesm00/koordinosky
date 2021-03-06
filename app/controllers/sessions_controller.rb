class SessionsController < ApplicationController
  def new
  end

  def create
    user = Estudiante.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to '/pages/index'
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
#Estudiante