class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "User sucessfully created"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update user_params
      flash.notice = "User '#{@user.username}' updated!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
