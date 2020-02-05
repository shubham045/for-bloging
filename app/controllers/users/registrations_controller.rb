# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :user_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  include Verify

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_to do |format|
      format.js
    end
  end

  def otp_verification
    binding.pry
    country_code, mobile_number = params[:user][:mobile].split('-')
    @otp_code = params[:user][:otp]
    response = valid_confirmation_code?(@otp_code, country_code, mobile_number)
    unless response == true
      user = User.find(params[:user_id])
      user.destroy
    else
      redirect_to new_user_session_path, notice: "SignIN to continuing"
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
