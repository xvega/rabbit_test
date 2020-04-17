class Dog < ApplicationRecord
  belongs_to :breed

  validates :name, :age, presence: true
end
