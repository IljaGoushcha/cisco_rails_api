class XobjectsController < ApplicationController

  def index
    render json: Xobject.generate_object_urls
  end

  def show
    @xobject = Xobject.find_by_uid(params[:id])
    if @xobject
      render json: @xobject, except: :id, status: :created, location: @xobject
    else
      render json: {verb: "GET", url: "http://localhost:3000/objects/#{params[:id]}", message: "uid does not exist"}
    end
  end

  def create
    @xobject = Xobject.new(allowed_params)

    if @xobject.save
      render json: @xobject, except: :id, status: :created, location: @xobject
    else
      render json: {verb: "POST", url: "http://localhost:3000/objects/", message: "Not a JSON object"}
    end
  end

  def update
    @xobject = Xobject.find_by_uid(params[:id])

    if @xobject.update(allowed_params)
      render json: @xobject, except: :id, status: :created, location: @xobject
    else
      render json: @xobject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @xobject = Xobject.find_by_uid(params[:id])

    if @xobject.destroy
      render json: @xobject, except: :id, status: :created, location: @xobject
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
