class TipsController < ApplicationController
  
  before_filter :login_required
  
  def show
    @matches_in_rounds = Match.all_matches_by_round
    @tips = Tip.where(:user_id => 1)
    @user = current_user
  end
  
  def edit
    @matches_in_rounds = Match.all_matches_by_round
    @user = current_user
    Match.all.each do |match|
      @user.tips.build :match => match unless @user.tips.include?(match)
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Deine Tipps wurden gespeichert"
      redirect_to tips_path
    else
      render :edit
    end
  end

end
