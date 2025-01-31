# spec/controllers/store_controller_spec.rb
require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      # expect(response).to be_successful # or use expect(response).to have_http_status(:success)
      expect(response).to have_http_status(:success)
    end
  end

  # Add more tests for other actions (show, create, update, destroy, etc.)
end
