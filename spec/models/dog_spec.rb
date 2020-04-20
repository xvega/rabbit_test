require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe 'dog creation' do

    let(:dog) { FactoryBot.create(:dog) }

    it 'creates a new dog' do
      expect { dog }.to change { Dog.count }.by(1)
    end
  end

  describe 'validations' do
    let(:dog) { FactoryBot.build(:dog, name: nil, age: nil) }

    it 'does not create a dog without a name' do
      expect do
        dog.save
        expect(dog.errors.messages[:name]).to include("can't be blank")
      end.to change { Dog.count }.by(0)
    end

    it 'does not create a dog without age' do
      expect do
        dog.save
        expect(dog.errors.messages[:age]).to include("can't be blank")
      end.to change { Dog.count }.by(0)
    end
  end
end
