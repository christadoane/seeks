class SecretsController < ApplicationController
  def index
  	@secrets = Secret.all
  end

  def new
  end
  def create
  	#current_user.secrets.create(params[:content])
  	#User.find(session[:id]).secrets.create
    @secret = Secret.new(content: params[:content], user_id: params[:user_id])
    if @secret.save
    	redirect_to "/users/#{session[:id]}"
    else
      @errors = @user.errors.full_messages
      flash[:errors] = @errors
  	  redirect_to "/users/#{session[:id]}"
    end
  end
  def destroy
  	@secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to '/secrets'
  end
end
