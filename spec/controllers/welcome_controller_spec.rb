require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
	context 'GET #index' do
		it 'returns a success response' do
			visit('/')
			response.successful?
		end
	end
end
