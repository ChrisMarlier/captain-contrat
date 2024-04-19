class FightsController < ApplicationController
    def show 
        @fight = Fight.find(params[:id])
    end
end
