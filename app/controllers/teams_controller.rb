class TeamsController < ApplicationController
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
  end

  def update
  end

end
