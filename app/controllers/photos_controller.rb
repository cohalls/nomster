class PhotosController < ApplicationController

  def create
    @photo = Place.find_by(id: params[:place_id]).photos.create(photo_params)
    if @photo.valid?
        redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end
end
