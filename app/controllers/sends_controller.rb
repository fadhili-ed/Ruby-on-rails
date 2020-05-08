class SendsController < ApplicationController
    def new
    end

    def create
        @send = Send.new(send_params)
        if @send.save
            redirect_to send_path(@send)
        else
            render 'new'
        end
    end
    private
        def send_params
            params.require(:send).permit(:sender_phone_number, :recepient_phone_number, :sender_id_number, :pin, :amount)
        end
end