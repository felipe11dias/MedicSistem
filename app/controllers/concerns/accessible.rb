module Accessible
    extend ActiveSupport::Concern
    included do
      before_action :check_doctor
    end
  
    protected
    def check_doctor
      if current_manager
        flash.clear
        # if you have rails_admin. You can redirect anywhere really
        redirect_to('/pages/index') && return
      elsif current_doctor
        flash.clear
        # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
        redirect_to(pages_home_path) && return
      end
    end
  end