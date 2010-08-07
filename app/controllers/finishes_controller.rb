class FinishesController < ApplicationController
  def index
    @finishes = Finish.find(:all, :order => 'place').select{|f| f.year == @year }
  end

  def show
    @finish = Finish.find(params[:id])
  end

  def new
    @finish = Finish.new
  end

  def create
    @finish = Finish.new(params[:finish])
    @finish.year = Year.find_by_year(Date.today.year)
    if @finish.save
      flash[:notice] = 'Finish was successfully created.'
      redirect_to year_finishes_path(@year)
    else
      render :action => 'new'
    end
  end

  def edit
    @finish = Finish.find(params[:id])
  end

  def update
    @finish = Finish.find(params[:id])
    
    if @finish.update_attributes(params[:finish])
      flash[:notice] = 'Finish was successfully updated.'
      year_finishes_path(@year)
    else
      render :action => 'edit'
    end    
  end

  def destroy
    Finish.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
end
