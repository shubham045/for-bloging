# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :user_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  include Verify

  def new
    @user = User.new
  end

  def create
    country_code, mobile_number = params[:user][:mobile].split('-')
    @response = valid_phone_number?(country_code, mobile_number)
    @user = User.create(user_params)
    respond_to do |format|
      format.js
    end
  end

  def otp_verification
    country_code, mobile_number = params[:user][:mobile].split('-')
    otp_code = params[:user][:otp]
    response = valid_confirmation_code?(otp_code, country_code, mobile_number)
    unless response == true 
      user = User.find(params[:user_id])
      user.destroy
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

    def user_params
      params.require(:user).permit(:name, :email, :mobile, :password, :password_confirmation, :otp)
    end

end
