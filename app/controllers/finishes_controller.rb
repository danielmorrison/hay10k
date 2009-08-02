class FinishesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def list
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
    
    if params[:finish]['number']
      person = Person.find_by_number(params[:finish].delete('number'))
      
      if person.nil? || !person.finishes.nil?
        flash[:notice] = 'That number is incorrect'
        redirect_to year_finishes_path(@year)
      end
      
      params[:finish]['person_id'] = person.id 
    end
  
    if @finish.update_attributes(params[:finish])
      flash[:notice] = 'Finish was successfully updated.'
      year_finishes_path(@year)
    else
      render :action => 'edit'
    end    
  end

  def destroy
    Finish.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
