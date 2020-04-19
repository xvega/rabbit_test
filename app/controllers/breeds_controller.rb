class BreedsController < ApplicationController

  # GET /breeds
  def index
    @breeds = Breed.all
    json_response(@breeds)
  end
end
