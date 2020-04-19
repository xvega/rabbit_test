require 'rails_helper'

RSpec.describe 'Breeds API', type: :request do
  let!(:breed) { FactoryBot.create(:breed) }

  # Test suite for GET /breeds (index)
  describe 'GET /breeds' do
    before { get '/breeds' }

    it 'returns breeds' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
