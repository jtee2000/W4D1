class ArtworkSharesController < ApplicationController 

  def destroy
    @artwork_share = ArtworkShare.find(params[:id])
    @artwork_share.destroy 
    redirect_to '/artworkshares'
  end

  def create 
    @artwork_share = ArtworkShare.new(strong_params)
    if @artwork_share.save 
        render json: @artwork_share 
    else  
        render json: @artwork_share.full_messages, status: 422 
    end
  end 

  private
  def strong_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end

end