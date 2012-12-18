class SessionsController < ApplicationController

  def login
  end

  # POST /sessions/create
  def create
      user = Contact.find_by_email(params[:email]) 
      if user && user.authenticate(params[:password]) 
        session[:current_user_authenticated] = user.id
        if user.isadmin 
          session[:current_user_admin] = user.isadmin
        end
        redirect_to "/", notice: 'You are now logged in'
      else
        flash[:error] = 'The login / password is not correct'
        render 'new'
      end
  end

  # GET /sessions/delete
  def logout
    session[:current_user_authenticated] = nil 
    session[:current_user_admin] = nil
    redirect_to new_session_path, notice: 'You are now logout.'
  end

end
 