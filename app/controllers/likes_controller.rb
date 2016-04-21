class LikesController < ApplicationController
  def index
  	@likes = Like.all
  end

  def create
  	@check = Like.where(user_id: params[:user_id], secret_id: params[:secret_id])
    if @check.count > 0
      flash[:errors] = ["You've already liked this secret"]
    else
      @like = Like.new(user_id: params[:user_id], secret_id: params[:secret_id])
      if @like.save
        redirect_to "/secrets"
      else
        @errors = @like.errors.full_messages
        flash[:errors] = @errors
  	    redirect_to "/secrets"
      end
    end
  end
  def destroy
    Like.where(user: current_user, secret: params[:secret_id]).first.destroy
    
    redirect_to '/secrets'
  end
end
