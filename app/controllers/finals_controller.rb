class FinalsController < ApplicationController
  
  before_filter :admin_required, :except => [ :index, :show ]
  
  def index
    redirect_to matches_path
  end

  def show
    redirect_to match_path(params[:id])
  end

  def new
    redirect_to new_match_path
  end

  def create
    @final = Final.new params[:final]
    
    if @final.save
      flash[:notice] = "Spiel wurde erfolgreich erstellt"
      redirect_to new_match_path
    else
      render :new
    end
  end
  
  def edit
    redirect_to edit_match_path params[:id]
  end

  def update
    @final = Final.find params[:id]
    
    if @final.update_attributes params[:final]
      flash[:notice] = "Spiel wurde erfolgreich geändert"
      redirect_to matches_path
    else
      render :edit
    end
  end
end
