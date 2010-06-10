class TipsController < ApplicationController
  def show
    @matches_in_rounds = Match.all_matches_by_round
    @tips = Tip.where(:user_id => 1)
    @user = User.find(1)
  end

  def new
  end

  def create
  end

  def edit
    @matches_in_rounds = Match.all_matches_by_round
    #@tips = Tip.where(:user_id => 1)
    @user = User.find(1)
    Match.all.each do |match|
      @user.tips.build :match_id => match.id unless @user.tips.include?(match)
    end
  end

  def update
    @user = User.find(1) #current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Deine Tipps wurden gespeichert"
      redirect_to tips_path
    else
      render :edit
    end
  end

end