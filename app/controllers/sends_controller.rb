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

    def show
        @send = Send.find(params[:id])
    end

    private
        def send_params
            params.permit(:sender_phone_number, :recepient_phone_number, :sender_id_number, :pin, :amount)
        end
end