require 'rails_helper'

RSpec.describe BreedsController, type: :controller do

  before(:each) do
    @access_token = FactoryBot.create(:api_key).access_token
    http_login(@access_token)
  end

  let!(:breed) { FactoryBot.create(:breed) }

  # Test suite for GET /breeds (index)
  describe 'GET /breeds' do
    before do
      get :index, format: 'json'
    end

    it 'returns breeds' do
      expect(json['data'].first['attributes']).not_to be_empty
      expect(json['data'].size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
