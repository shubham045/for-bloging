module ControllerHelpers

	def user_login	
		@user = FactoryBot.create(:user)
		sign_in @user
	end

	def create_article
		@article = FactoryBot.create(:article, user_id: @user.id)
	end

end