class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :verify_authenticity_token

    def root
      redirect_to ('/doctors/sign_in') if doctor_signed_in?
      redirect_to ('/managers/sign_in') if manager_signed_in?
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :birthday, :registration, :salary, :crm])
    end
end
