# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
      # UserMailer.with(user: @user).welcome_email.deliver_later
      # format.html { redirect_to(@user, notice: 'User was successfully created.') }
      # format.json { render json: @user, status: :created, location: @user }
    else
      # format.html { render action: 'new' }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :phone_number, :id_number)
  end
end
