class AlbumsController < ApplicationController
  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    @bands = Band.all
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "Album successfully created!"
      redirect_to album_url(@album.id)
    else
      flash[:errors] = @album.errors.full_messages
      if album_params[:band].nil?
        redirect_to new_album_url
      else
        redirect_to new_band_album_url(album_params[:band_id])
      end
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    render :new
  end

  def show
    @album = Album.find_by(id: params[:id])
    if @album
      render :show
    else
      flash[:errors] = "Album not found"
      redirect_to :index
    end
  end

  def update
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :live, :band_id)
  end
end
