class DoctorsController < ApplicationController
    before_action :authenticate_manager!, only: [:show, :index]
    
    def index
        @doctors = Doctor.all
    end

    def show
        @doctor = Doctor.find(params[:id])
    end
end
