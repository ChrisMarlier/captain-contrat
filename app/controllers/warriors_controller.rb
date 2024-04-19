class WarriorsController < ApplicationController
    def new
        @warrior = Warrior.new
    end

    def create
        @warrior = Warrior.new(warrior_params)
        if @warrior.save
          redirect_to warrior_path(@warrior), notice: "Warrior created !"
        else
          render :new
        end
    end

    def show 
        @warrior = Warrior.find(params[:id])
    end
    
    private
    
    def warrior_params
        params.require(:warrior).permit(:name, :attack, :defense)
    end
end
