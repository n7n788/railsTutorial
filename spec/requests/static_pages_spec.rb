require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe '#home' do
    it 'returns a http success' do
      get static_pages_home_path
      expect(response).to have_http_status(:success)
    end
  end

  describe '#help' do
    it 'returns a http success' do
      get static_pages_help_path
      expect(response).to have_http_status(:success)
    end
  end
end
