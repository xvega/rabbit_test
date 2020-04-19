class DogsController < ApplicationController

  before_action :set_dog, only: %i[show update destroy]

  # GET /dogs
  def index
    @dogs = Dog.all
    json_response(@dogs)
  end

  # POST /dogs
  def create
    @dog = Dog.create!(dog_params)
    json_response(@dog, :created)
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

  def dog_params
    params.require(:dog).permit(:name, :breed_id, :age, :weight)
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end
end
