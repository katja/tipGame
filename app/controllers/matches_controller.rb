class MatchesController < ApplicationController
  
  before_filter :admin_required, :except => [ :index, :show ]
  
  def index
    if Match.update_matches
      flash[:notice] = "Ergebnisse ganz aktuell neu geholt :)"
    end
    @preliminaries = Preliminary.all
    @finals = Final.all
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
      flash[:notice] = "Spiel wurde erfolgreich erstellt"
      redirect_to new_match_path
    else
      render :new
    end
  end

  def edit
    @match = Match.find params[:id]
  end
end
