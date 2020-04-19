class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :rescuer_name, :day_limit, :dog

  def breed
    object.dog.name
  end
end
