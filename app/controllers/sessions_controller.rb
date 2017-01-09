class SessionsController < ApplicationController
  def new
  end


  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#go to home page or some shit 
  		log_in user
  		redirect_to user_url(user)
  	else
  		#create error message
  		flash.now[:danger] = "Incorrect login"
		render 'new'
  	end
  end


  def destroy
  	log_out
  	redirect_to root_url
  end

end
