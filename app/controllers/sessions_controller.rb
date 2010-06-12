class SessionsController < ApplicationController
  def new
    @login = Login.new
  end
  
  def create
    @login = Login.new params[:login]
    if user = @login.validate
      session[:user_id] = user.id
      flash[:notice] = "Hallo #{user.name}"
      redirect_to user
    else
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
