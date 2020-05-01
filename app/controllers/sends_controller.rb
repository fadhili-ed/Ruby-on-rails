frozen_string_literal: true

class SendsController < ApplicationController
  def new
    @send = Send.find(params[:id])
  end

  def create; end
end
