require_dependency "binda/application_controller"

module Binda
  class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy, :remove_image]

    def index
      @images = Image.all
    end

    def show
      redirect_to action: :edit
    end

    def new
      @image = Image.new
    end

    def edit
    end

    def create
      @image = Image.new(image_params)

      if @image.save
        redirect_to image_path( @image.id ), notice: 'Image was successfully created.'
      else
        render :new
      end
    end

    def update
      if @image.update(image_params)
        redirect_to image_path( @image.id ), notice: 'Image was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @image.destroy
      redirect_to images_url, notice: 'Image was successfully destroyed.'
    end

    def remove_image
      @image.remove_image!
      @image.save!
      render js: "$('#fileupload-#{@image.id} .form-item--image--image').removeAttr('src').removeAttr('alt');
      $('#fileupload-#{@image.id} .fileupload--remove-image-btn').addClass('invisible')"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Image.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:image).permit( :image, :name )
      end
  end
end
