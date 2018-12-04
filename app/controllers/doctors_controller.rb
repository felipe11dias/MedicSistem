class DoctorsController < ApplicationController
    before_action :authenticate_manager!, only: [:show, :edit, :update, :destroy]
    
    def index
        @doctors = Doctor.all
    end

    def show
        @doctor = Doctor.find(params[:id])
    end
end
