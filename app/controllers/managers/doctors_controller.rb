class Managers::DoctorsController < ApplicationController
    before_action :authenticate_manager!, only: [:edit, :update, :destroy]
    before_action :set_doctor, only: [:edit, :update, :destroy]

    def new
        @doctor = Doctor.new
    end
    
    def edit
    end
    
    def create
        @doctor = Doctor.new(doctor_params)
        respond_to do |format|
          if @doctor.save
            format.html { redirect_to doctors_index_path, notice: 'Doctor was successfully created.' }
            format.json { render :show, status: :created, location: @doctor }
          else
            format.html { render :new }
            format.json { render json: @doctor.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
            if @doctor.update(doctor_params)
              format.html { redirect_to doctors_index_path, notice: 'doctor was successfully updated.' }
              format.json { render :show, status: :ok, location: @doctor }
            else
              format.html { render :edit }
              format.json { render json: @doctor.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy
        begin
        @doctor.destroy
            respond_to do |format|
                format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
                format.json { head :no_content }
            end
        rescue => e
            redirect_to doctors_index_path, alert: 'Doctor can not be excluded.'
        end
    end

    private
    def set_doctor
        @doctor = Doctor.find_by_id(params[:id])
    end

    def doctor_params
        params.require(:doctor).permit(:full_name, :crm, :birthday, :salary, :email, :password, :password_confirmation)
    end

end