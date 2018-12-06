class PagesController < ApplicationController
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