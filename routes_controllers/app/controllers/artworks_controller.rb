class ArtworksController < ApplicationController 
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  def show 
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(strong_params)
      redirect_to '/artworks'
    else
      render json: @artwork.full_messages, status: 422 
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy 
    redirect_to '/artworks'
  end

  def create 
    @artwork = Artwork.new(strong_params)
    if @artwork.save 
        render json: @artwork 
    else  
        render json: @artwork.full_messages, status: 422 
    end
  end 

  private
  def strong_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end