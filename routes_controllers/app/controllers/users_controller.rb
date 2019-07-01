class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show 
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(strong_params)
      redirect_to '/users'
    else
      render json: @user.full_messages, status: 422 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy 
    redirect_to '/users'
  end

  def create 
    @user = User.new(strong_params)
    if @user.save 
        # render json: @user
        redirect_to "/users/#{@user.id}" 
    else  
        render json: @user.full_messages, status: 422 
    end
  end 

  private
  def strong_params
    params.require(:user).permit(:username)
  end


end