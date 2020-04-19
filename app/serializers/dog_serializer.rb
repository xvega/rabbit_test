class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :weight, :breed

  def breed
    object.breed.name
  end
end
