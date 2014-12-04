class ObjectsController < ApplicationController

  def index
    @objects = Object.all
    render json: @objects
  end

  def show
    @object = Object.find(params[:uid])
    if @object
      render json: @object, status: :created, location: @object
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  def create
    @object = Object.new(allowed_params)

    if @object.save
      render json: @object, status: :created, location: @object
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  def update
    @object = Object.find(params[:uid])

    if @object.update(allowed_params)
      render json: @object, status: :created, location: @object
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @object = Object.find(params[:uid])

    if @object.destroy
      render json: @object, status: :created, location: @object
    else
      render json: @object.errors, status: :unprocessable_entity
    end
  end


  private

  def allowed_params
    # I wonder what happens with timestamp fields?
    params.require(:object).permit(:uid, :firstName, :lastName, :dob, :dod)
  end

end
