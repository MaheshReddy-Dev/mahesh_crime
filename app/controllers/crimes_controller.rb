class CrimesController < ApplicationController
  before_action :set_crime, only: %i[show edit update destroy]


  def show
  end

  def index
    @home = true
    @crimes = Crime.all
  end

  def new
    @crime = Crime.new(crime_params)
    unless params[:crime] == nil
      @city = City.find(params[:crime][:locality][:city_id])
    end
    @cities = City.all
    @locality = Locality.new
    @cr = CrimeReporter.new
    @crs = CrimeReporter.all
  end

  def create
    @crime = Crime.new(crime_params)
    if params[:crime][:crime_reporter][:reporter].present?
      @cr = CrimeReporter.create(reporter: params[:crime][:crime_reporter][:reporter])
      @crime.crime_reporter_id = @cr.id
    end
    if params[:crime][:locality][:locality].present?
      @locality = Locality.create(locality: params[:crime][:locality][:locality], city_id: params[:crime][:locality][:city_id])
      @crime.locality_id = @locality.id
    end
    respond_to do |format|
      if @crime.save
        format.turbo_stream do
          turbo_stream.replace(
            "crimes", 
            partial: "crimes/crime", 
            locals: { crime: @crime }
          )
        end
        format.html { redirect_to root_path, notice: "Crime was successfully created." }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end

  def update
     respond_to do |format|
       if @crime.update(crime_params)
         format.html { redirect_to root_path, notice: "Crime details updated succesfully." }
         format.json { render :show, status: :created, crime: @crime }
       else
         format.turbo_stream { render :form_update, status: :unprocessable_entity }
         format.html { render :edit, status: :unprocessable_entity }
        end
     end
  end

  def destroy
    @crime.destroy
    redirect_to crimes_path
    flash[:alert] = "the crime was deleted."
  end

  private

  def set_crime
    @crime = Crime.find(params[:id])
  end
  


  def crime_params
    params.fetch(:crime, {}).permit(:description, :locality_id, :crime_reporter_id,
                          :crime_type, :priority, :resolved, crime_reporter_attr: [:reporter],
                          locality_atrr: [:locality, :city_id])
  end
end
