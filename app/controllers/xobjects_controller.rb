class XobjectsController < ApplicationController

  def index
    @xobjects = Xobject.all
    render json: @xobjects
  end

  def show
    @xobject = Xobject.find(params[:uid])
    if @xobject
      render json: @xobject, status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end

  def create
    @xobject = Xobject.new(allowed_params)

    if @xobject.save
      render json: @xobject, status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end

  def update
    @xobject = Xobject.find(params[:uid])

    if @xobject.update(allowed_params)
      render json: @xobject, status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @xobject = Xobject.find(params[:uid])

    if @xobject.destroy
      render json: @xobject, status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end


  private

  def allowed_params
    # I wonder what happens with timestamp fields?
    params.require(:xobject).permit(:uid, :firstName, :lastName, :dob, :dod)
  end

end
