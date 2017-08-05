class PeopleController < AuthenticatedController

  def index
    @people = Person.joins(registrations: :year).includes(:gender, :races).where(years: {year: @year.year}).order('last_name, first_name')
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    @person.registrations.build(:year => @year, :race_id => params[:race_id])
    if @person.save
      flash[:notice] = 'Person was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      @person.registrations.find_by_year_id!(@year.id).update_attribute(:race_id, params[:race_id])

      flash[:notice] = 'Person was successfully updated.'
      redirect_to year_people_path(@year)
    else
      render :action => 'edit'
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private

  def person_params
    params.require(:person).permit(:number, :first_name, :last_name, :age, :gender_id, :city, :state, )
  end
end
