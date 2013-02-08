class SessionsController < ApplicationController
  before_filter :require_admin_right, :only => [:become]

  def become
    if params[:contact_id].present?
      session[:current_user_authenticated] = params[:contact_id]
      flash[:notice] = 'You became contact ' + params[:contact_id]
    else
      flash[:error] = 'You can not become contact ' + params[:contact_id]
    end
    redirect_to "/"
  end

  def login
    if session[:current_user_authenticated].present? 
      redirect_to sessions_logout_path
    end
  end

  def create
      contact = Contact.find_by_email(params[:email]) 
      if contact && contact.authenticate(params[:password]) 

        session[:current_user_authenticated] = contact.id

        if contact.isadmin 
          session[:current_user_admin] = contact.isadmin
        end
        redirect_to "/", notice: 'You are now logged in'
      else
        flash[:error] = 'The login / password is not correct.'
        render 'login'
      end
  end

  def logout
    session[:current_user_authenticated] = nil 
    session[:current_user_admin] = nil
    redirect_to sessions_new_path, notice: 'You are now logout.'
  end

end
 