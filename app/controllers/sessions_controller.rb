class SessionsController < ApplicationController
  def index
  end

  def new
    #session.clear
  end
  def create
  	user = User.find_by_email(params[:email])
		unless user
      flash[:errors] = ["Invalid Credentials"]
      redirect_to '/sessions/new'
    else
      if user.authenticate(params[:password])
			session[:id] = user.id
			redirect_to "/users/#{session[:id]}"
		  else
			flash[:errors] = ["Invalid password"]
      redirect_to '/sessions/new'
      end
		end
  end
  def destroy
    session[:id] = nil
    redirect_to '/sessions/new'
  end

    #if @person = @user.authenticate('params[:password]')
    #	session[:id] = user.id
  	#	redirect_to '/users/#{@user.id}'
  	#else
  	#	flash[:errors] = @user.errors.full_messages
  	#	redirect_to '/sessions/new'
  	#end
  	#redirect_to '/users/show'
  #end
end
