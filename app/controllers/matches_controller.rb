class MatchesController < ApplicationController
  
  before_filter :admin_required, :except => [ :index, :show ]
  
  def index
    @matches_in_rounds = Match.all_matches_by_round
  end

  def show
    @match = Match.find params[:id]
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new params[:match]
    
    if @match.save
      flash[:notice] = "Match wurde erfolgreich erstellt"
      redirect_to new_match_path
    else
      render :new
    end
  end

  def edit
    @match = Match.find params[:id]
  end

  def update
    @match = Match.find params[:id]
    
    if @match.update_attributes
      flash[:notice] = "Match wurde erfolgreich geändert"
      redirect_to matches_path
    else
      render :edit
    end
  end
end
