class Dog < ApplicationRecord
  belongs_to :breed
  has_one :reservation

  validates :name, :age, presence: true

  scope :total_by_breed, -> { joins(:breed).group('breeds.name').count }
  scope :age_avg, -> { average(:age) }
  scope :weight_avg, -> { average(:weight) }
  scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :by_age, ->(age) { where(age: age) }
  scope :by_weight, ->(weight) { where(weight: weight) }

  def self.summarized_data
    {
      total_by_breed: total_by_breed,
      age_avg: age_avg,
      weight_avg: weight_avg
    }
  end

  def self.filter_by_params(params)
    dogs = all
    return dogs.by_name(params[:name]) if params[:name].present? && params[:name] != ''
    return dogs.by_age(params[:age]) if params[:age].present? && params[:age] != ''
    return dogs.by_weight(params[:weight]) if params[:weight].present? && params[:weight] != ''
    dogs
  end
end
