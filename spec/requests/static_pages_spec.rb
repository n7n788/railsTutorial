require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe '#home' do
    it 'returns a http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe '#help' do
    it 'returns a http success' do
      get help_path
      expect(response).to have_http_status(:success)
    end
  end

  describe '#contact' do
    it 'return a http success' do
      get contact_path
      expect(response).to have_http_status(:success)
    end
  end

  describe '#about' do
    it 'returns a http success' do
      get about_path
      expect(response).to have_http_status(:success)
    end
  end
end
