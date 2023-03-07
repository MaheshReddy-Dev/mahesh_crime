class ReportersController < ApplicationController
    before_action :set_reporter, only: %i[show edit update destroy]
  
    def show
    end
  
    def index
      @reporters = Reporter.all
    end
  
    def new
      @reporter = Reporter.new
    end
  
    def create
      @reporter = Reporter.new(reporter_params)
      if @reporter.save
        flash[:notice] = "Successfully registered new crime reporter."
        redirect_to @reporter
      else
        render 'new', status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @reporter.update(reporter_params)
        flash[:notice] = "#{@reporter.reporter} information updated successfully."
        redirect_to @reporter
      else
        render 'edit', status: :unprocessable_entity
      end
    end
  
    def destroy
      @reporter.destroy
      redirect_to reporters_path
      flash[:alert] = "#{@reporter.reporter} information was deleted."
    end
  
    private
  
    def set_reporter
      @reporter = Reporter.find(params[:id])
    end
  
    def reporter_params
      params.require(:reporter).permit(:reporter,:email,:phone)
    end
  end
  