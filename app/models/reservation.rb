class Reservation < ApplicationRecord
  belongs_to :dog

  validates :dog_id, uniqueness: true, presence: true
  validates :rescuer_name, presence: true
end
