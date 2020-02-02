# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :user_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  include Verify

  def new
    super
  end

  # POST /resource
  def create
    country_code, mobile_number = params[:user][:mobile].split('-')
    # @response = valid_phone_number?(country_code, mobile_number)
    @response = true
    @user = User.new(user_params)
    @some = @user
    respond_to do |format|
      format.js
    end
  end

  def otp_verification
    binding.pry
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

  # If you have extra params to permit, append them to the sanitizer.
  def user_params
    params.require(:user).permit(:name, :email, :mobile, :password, :password_confirmation, :otp)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
