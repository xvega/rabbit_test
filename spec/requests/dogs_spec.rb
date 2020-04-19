require 'rails_helper'

RSpec.describe 'Dogs API', type: :request do
  let(:breed) { FactoryBot.create(:breed) }
  let!(:dog) { FactoryBot.create(:dog) }
  let(:dog_id) { dog.id }

  # Test suite for GET /dogs (index)
  describe 'GET /dogs' do
    before { get '/dogs' }

    it 'returns dogs' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suit for GET /dogs/:id (show)
  describe 'GET /dog/:id' do
    before { get "/dogs/#{dog_id}" }

    context 'when the record exists' do
      it 'returns the dog' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(dog_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:dog_id) { 666 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Dog/)
      end
    end
  end

  # Test suit for POST /dogs (create)
  describe 'POST /dogs' do

    # valid dog
    let(:valid_attributes) do
      { name: 'Ringo', age: '70', weight: '50', breed_id: breed.id }
    end

    context 'when the request is valid' do
      before { post '/dogs', params: { dog: valid_attributes } }

      it 'creates a dog' do
        expect(json['name']).to eq('Ringo')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      let(:invalid_attributes) do
        { name: 'incomplete dog' }
      end

      before do
        post '/dogs', params: { dog: invalid_attributes }
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

  # Test suite for PUT /dogs/:id
  describe 'PUT /dogs/:id' do

    # valid dog
    let(:valid_attributes) do
      { name: 'Ringo', age: '70', weight: '50', breed_id: '2' }
    end

    context 'when the record exists' do
      before do
        put "/dogs/#{dog_id}", params: { dog: valid_attributes }
      end

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /dogs/:id
  describe 'DELETE /dogs/:id' do
    before { delete "/dogs/#{dog_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
