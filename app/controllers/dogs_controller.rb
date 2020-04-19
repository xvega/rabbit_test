class DogsController < ApplicationController

  include Orderable
  include Pagination

  before_action :set_dog, only: %i[show update destroy]

  # GET /dogs
  def index
    @dogs = filter_dogs
    json_response(@dogs, meta: pagination_meta(@dogs, { summarized_data: Dog.summarized_data }))
  end

  # POST /dogs
  def create
    @dog = Dog.create!(dog_params)
    json_response(@dog, status: :created)
  end

  # GET /dogs/:id
  def show
  json_response(@dog)
  end

  # DELETE /dogs/:id
  def destroy
    @dog.destroy
    head :no_content
  end

  # PUT /dogs/:id
  def update
    @dog.update(dog_params)
    head :no_content
  end

  private

  def filter_dogs
    Dog.order(ordering_params(params))
       .page(params[:page] ? params[:page] : 1)
       .per(params[:limit] ? params[:limit] : 10)
  end

  def dog_params
    params.require(:dog).permit(:name, :breed_id, :age, :weight)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
