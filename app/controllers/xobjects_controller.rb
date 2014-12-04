class XobjectsController < ApplicationController

  def index
    @xobjects = Xobject.all
    render json: @xobjects, only: [:uid, :firstName, :lastName, :dob, :dod]
  end

  def show
    @xobject = Xobject.find_by_uid(params[:id]) #@xobject = Xobject.find(params[:id])
    if @xobject
      render json: @xobject, only: [:uid, :firstName, :lastName, :dob, :dod], status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end

  def create
    @xobject = Xobject.new(allowed_params)

    if @xobject.save
      render json: @xobject, only: [:uid, :firstName, :lastName, :dob, :dod], status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end

  def update
    @xobject = Xobject.find_by_uid(params[:id])

    if @xobject.update(allowed_params)
      render json: @xobject, only: [:uid, :firstName, :lastName, :dob, :dod], status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @xobject = Xobject.find_by_uid(params[:id])

    if @xobject.destroy
      render json: @xobject, only: [:uid, :firstName, :lastName, :dob, :dod], status: :created, location: @xobject
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
