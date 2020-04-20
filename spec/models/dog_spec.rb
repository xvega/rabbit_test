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

  describe '#filter_by_params' do
    before(:each) do
      FactoryBot.create(:dog, age: 10, name: 'ringo', weight: 15)
      FactoryBot.create(:dog, age: 10, name: 'lennon')
      FactoryBot.create(:dog, age: 10, name: 'paul')
      FactoryBot.create(:dog, age: 10, name: 'ringo', weight: 20)
    end

    context 'when there are records in the DB' do
      it 'filters by name' do
        params = { name: 'ringo', age: 12 }
        expect(Dog.filter_by_params(params).count).to eq(2)
      end

      it 'filters by age' do
        params = { age: 10 }
        expect(Dog.filter_by_params(params).count).to eq(4)
      end

      it 'filters by weight' do
        params = { weight: 15 }
        expect(Dog.filter_by_params(params).count).to eq(1)
      end
    end

    context 'when there are no records in the DB' do
      it 'filters by name' do
        params = { name: 'none' }
        expect(Dog.filter_by_params(params).count).to eq(0)
      end

      it 'filters by age' do
        params = { age: 70 }
        expect(Dog.filter_by_params(params).count).to eq(0)
      end

      it 'filters by weight' do
        params = { weight: 10 }
        expect(Dog.filter_by_params(params).count).to eq(0)
      end
    end
  end
end
