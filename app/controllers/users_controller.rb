class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
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
    
    if @user.update_attributes params[:user]
      flash[:notice] = "Deine Änderungen wurden gespeichert"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

end
