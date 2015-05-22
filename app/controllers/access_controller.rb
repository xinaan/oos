class AccessController < ApplicationController
before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout, :verify]
  layout 'login'
  
  def index
  
  end
  
  def verify

  end

  def login
  
  end
  
  def attempt_login
		authorized_user = User.authenticate(params[:username], params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:username] = authorized_user.username
			if authorized_user.is_verified?
				session[:is_verified] = true
				redirect_to products_path
			else
				flash[:notice]= "Please Verify Your Account"
				redirect_to(action: 'verify')
			end
		else
			flash[:notice]= "Invalid Username/Password Try Again"
			redirect_to(action: 'login')
		end
	end

def attempt_verify
	verified_user = User.verify(session[:user_id], params[:code])
	if verified_user
			verified_user.active
			verified_user.save
			session[:is_verified] = true
			redirect_to products_path
	else
		flash[:notice]= "Invalid Code Please Try Again"
		redirect_to(action: 'verify')
	end
end
  
	def logout
		session[:user_id] = nil
		session[:username] = nil
		session[:is_verified] = nil
		redirect_to(action: 'login')
  end
end
