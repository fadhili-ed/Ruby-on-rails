class DepositsController < ApplicationController
    def new
    end
    def create
        @deposit = Deposit.new(deposit_params)
        if @deposit.save
          redirect_to deposits_path(@deposit)
        else
          render 'new'
        end
    end
    def show
        @deposit = Deposit.find(params[:id])
    end
    
    private
      def deposit_params
        params.require(:deposit).permit(:first_name, :last_name, :deposits)
      end
end