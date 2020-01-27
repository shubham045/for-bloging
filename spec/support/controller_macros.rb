module ControllerMacros

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user_login = FactoryBot.create(:user)
    user_login.confirm 
    sign_in user_login
  end

  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

end
