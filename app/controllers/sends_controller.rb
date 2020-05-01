frozen_string_literal: true

class SendsController < ApplicationController
  def new
    @send = Send.new
  end

  def create; end
end
