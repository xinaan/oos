class AccessController < ApplicationController
before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  layout 'login'
  
  def index
  
  end
  
  def menu
  
  end

  def login
  
  end
  
  def attempt_login
		authorized_user = User.authenticate(params[:username], params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:username] = authorized_user.username
			redirect_to products_path
			flash[:notice]= "Welcome " + authorized_user.username + "."
		else
			flash[:notice]= "Invalid Username/Password Try Again"
			redirect_to(action: 'login')
		end
  end
  
	def logout
		session[:user_id] = nil
		session[:username] = nil
		redirect_to(action: 'login')
  end
end
