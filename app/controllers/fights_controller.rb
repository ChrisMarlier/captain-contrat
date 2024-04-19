class FightsController < ApplicationController
    def new
        @fight = Fight.new
    end

    def create
        @fight = Fight.new(fight_params)
        begin
          @fight.save!
          @fight.reload
          @fight.start
          redirect_to @fight, notice: 'Fight was successfully created.'
        rescue ActiveRecord::RecordInvalid => e
          flash.now[:alert] = e.record.errors.full_messages.join(', ')
          render :new
        end
    end


    def show 
        @fight = Fight.find(params[:id])
    end

    private 

    def fight_params
        params.require(:fight).permit(:warrior1_id, :warrior2_id, :warrior1_item_id, :warrior2_item_id)
    end

end
