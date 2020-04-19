class ReservationsController < ApplicationController

  # GET /reservations
  def index
    @reservations = Reservation.all
    json_response(@reservations)
  end

  # POST /reservations
  def create
    @reservation = Reservation.create!(reservation_params)
    json_response(@reservation, status: :created)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:rescuer_name, :dog_id, :day_limit)
  end
end
