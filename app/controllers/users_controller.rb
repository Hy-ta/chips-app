class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def new
    @user = User.new(:user_params)
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    flash[:notice] = "Only authenticate user" unless user_signed_in?
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def edit
    if current_user != @user
      redirect_to user_path(@user), notice: 'You have no permission'
      @user = User.find(params[:id])
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :image, :password, :password_confirmation)
  end
end
