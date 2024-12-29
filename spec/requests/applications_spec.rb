require 'rails_helper'

RSpec.describe "Applications", type: :request do
  describe '#hello' do
    it 'returns a http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
