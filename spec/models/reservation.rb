require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'reservation creation' do

    let(:reservation) { FactoryBot.create(:reservation) }

    it 'creates a new reservation' do
      expect { reservation }.to change { Reservation.count }.by(1)
    end
  end

  describe 'validations' do
    let(:dog) { FactoryBot.create(:dog) }
    let(:reservation) { FactoryBot.build(:reservation, rescuer_name: nil, dog_id: nil) }

    it 'does not create a reservation without a dog' do
      expect do
        reservation.save
        expect(reservation.errors.messages[:rescuer_name]).to include("can't be blank")
      end.to change { Reservation.count }.by(0)
    end

    it 'does not create a dup reservation' do
      FactoryBot.create(:reservation, rescuer_name: 'original', dog_id: dog.id)
      dup_reservation = FactoryBot.build(:reservation, rescuer_name: 'dup', dog_id: dog.id)
      expect do
        dup_reservation.save
        expect(dup_reservation.errors.messages[:dog_id]).to include("has already been taken")
      end.to change { Reservation.count }.by(0)
    end
  end
end
