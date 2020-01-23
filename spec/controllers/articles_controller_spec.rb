require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	context 'GET #show' do
		it 'returns a success response' do
			visit('/articles')
			response.successful?
		end
	end

	context 'create object of current users article' do
		it 'return a articles object' do
			visit('/articles/new')
		end
	end
end
