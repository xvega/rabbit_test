class Dog < ApplicationRecord
  belongs_to :breed
  has_one :reservation

  validates :name, :age, presence: true

  scope :total_by_breed, -> { joins(:breed).group('breeds.name').count }
  scope :age_avg, -> { average(:age) }
  scope :weight_avg, -> { average(:weight) }
  scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }

  def self.summarized_data
    {
      total_by_breed: total_by_breed,
      age_avg: age_avg,
      weight_avg: weight_avg
    }
  end
end
