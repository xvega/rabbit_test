require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  before(:each) do
    @access_token = FactoryBot.create(:api_key).access_token
    http_login(@access_token)
  end

  let(:dog) { FactoryBot.create(:dog) }
  let(:dog_number_two) { FactoryBot.create(:dog) }
  let!(:reservation) { FactoryBot.create(:reservation, dog_id: dog.id) }

  # Test suite for GET /breeds (index)
  describe 'GET /reservations' do
    before do
      get :index, format: 'json'
    end

    it 'returns reservations' do
      expect(json['data'].first['attributes']).not_to be_empty
      expect(json['data'].size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suit for POST /reservations (create)
  describe 'POST /reservations' do

    # valid reservation params
    let(:valid_attributes) do
      { rescuer_name: 'Yoko Ono', day_limit: 10, dog_id: dog_number_two.id }
    end

    context 'when the request is valid' do
      before do
        post :create, params: { reservation: valid_attributes }
      end

      it 'creates a reservation' do
        expect(json['data']['attributes']['rescuer-name']).to eq('Yoko Ono')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      let(:invalid_attributes) do
        { rescuer_name: 'Yoko Ono', day_limit: 10, dog_id: dog.id }
      end

      before do
        post :create, params: { reservation: invalid_attributes }
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        errors = JSON.parse(response.body)
        expect(errors['message']).to match(/Validation failed/)
      end
    end
  end
end
