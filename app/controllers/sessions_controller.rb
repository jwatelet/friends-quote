class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email_or_username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || root_url),
                  notice: "Welcome back, #{user.firstname} #{user.lastname}!"
      session[:intended_url] = nil
    else
      flash.now[:alert] = 'Invalid email/password combination!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, status: :see_other,
                           notice: "You're now signed out!"
  end
end
