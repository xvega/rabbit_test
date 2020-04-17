require 'rails_helper'

RSpec.describe Breed, type: :model do
  describe 'breed creation' do

    let(:breed) { FactoryBot.create(:breed) }

    it 'creates a new product' do
      expect { breed }.to change { Breed.count }.by(1)
    end
  end
end
