class Managers::DoctorsController < ApplicationController
    before_action :authenticate_manager!
    before_action :set_doctor

    def edit
        
    end

    def update

    end

    def destroy

    end

    private 
    def set_doctor
        @doctor = Doctor.find_by_id(params[:id])
    end

end