class UsersController < ApplicationController

  before_filter :login_required, :except => [:new, :create]

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
      #UserMailer.registration_confirmation(@user).deliver
      current_user = @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    if @user.update_attributes params[:user]
      flash[:notice] = "Deine Änderungen wurden gespeichert"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

end
