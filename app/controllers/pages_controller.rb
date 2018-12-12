class PagesController < ApplicationController
    before_action :authenticate_manager!, only: [:index]
    before_action :authenticate_doctor!, only: [:home, :show_surgeries]
    
    # to manager
    def index
    end

    # to doctor
    def home
    end

    #doctor function
    def show_surgeries
        @surgeries = Surgery.all
    end
end