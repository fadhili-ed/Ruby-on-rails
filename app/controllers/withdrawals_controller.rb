# frozen_string_literal: true

class WithdrawalsController < ApplicationController
  def new
    @withdraw = Withdraw.new
  end
  def create
    @withdraw = Withdraw.new
  end
  # def show
  #   @withdraw = Withdraw.new
  # end
  # private
  #   def withdraw_params
  #     params.require(:withdraw).permit(:amount, :pin, :id_number)
  #   end
end
