class SessionsController < ApplicationController

  def login
    #ContactMailer.welcome_email.deliver
  end

  # POST /sessions/create
  def create

      contact = Contact.find_by_email(params[:email]) 
      if contact && contact.authenticate(params[:password]) 

        session[:current_user_authenticated] = contact.id

        if contact.isadmin 
          session[:current_user_admin] = contact.isadmin
        end
        redirect_to "/", notice: 'You are now logged in'
      else
        flash[:error] = 'The login / password is not correct'
        render 'login'
      end
  end

  # GET /sessions/delete
  def logout
    session[:current_user_authenticated] = nil 
    session[:current_user_admin] = nil
    redirect_to new_session_path, notice: 'You are now logout.'
  end

end
 