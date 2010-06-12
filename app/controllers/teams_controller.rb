class TeamsController < ApplicationController
  
  before_filter :admin_required, :except => [ :index, :show ]
  
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new params[:team]
    
    if @team.save
      flash[:notice] = "Team wurde erfolgreich erstellt"
      redirect_to new_team_path
    else
      render :new
    end
  end

  def edit
    @team = Team.find params[:id]
  end

  def update
    @team = Team.find params[:id]
    
    if @team.update_attributes params[:team]
      flash[:notice] = "Mannschaft #{@team.name} wurde erfolgreich geändert"
      redirect_to teams_path
    else
      render :edit
    end
  end

end
