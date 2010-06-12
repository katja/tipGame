class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_not_logged_in
  
  def new
    render :new
  end

  def create
    @user = User.find_by_mail(params[:mail])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Es wurde eine Email an dich versendet, mit der du dein Passwort ändern kannst."
      redirect_to root_url
    else
      flash[:notice] = "Es wurde kein User mit der angegebenen Email-Adresse gefunden."
      render :action => :new
    end
  end
  
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user
      flash[:notice] = "Dein Passwort wurde geändert"
      redirect_to root_url
    else
      render :action => :edit
    end
  end
  
private  
  def load_user_using_perishable_token  
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = "Leider konnte dein Account nicht gefunden werden." +
      "Probier es nochmal mit copy&paste der Adresse der Email in den Browser." +
      "Falls du weiterhin nicht weiter kommst, setze dein Passwort ein erneutes Mal zurück."
      redirect_to root_url
    end
  end
  
  def require_not_logged_in
    if logged_in?
      flash[:notice] = "Für diese Funktion darfst du nicht eingeloggt sein."
      redirect_to root_url
    end
  end
end
