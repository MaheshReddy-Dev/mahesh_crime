class LocalitiesController < ApplicationController
    before_action :set_locality, only: %i[show edit update destroy]
  
    def show
    end
  
    def index
      @localities = Locality.all
    end
  
    def new
      @locality = Locality.new
    end
  
    def create
      @locality = Locality.new(locality_params)
      if @locality.save
        flash[:notice] = "Successfully added new locality."
        redirect_to crimes_url
      else
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  
    def edit
    end
  
    def update
      if @locality.update(locality_params)
        flash[:notice] = "Locality information updated successfully."
        redirect_to crimes_url
      else
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  
    def destroy
      @locality.destroy
      redirect_to crimes_url
      flash[:alert] = "Location was deleted."
    end
  
    private
  
    def set_locality
      @locality = Locality.find(params[:id])
    end
  
    def locality_params
      params.require(:locality).permit(:locality, :city_id)
    end
  end
  