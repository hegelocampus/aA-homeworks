class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = "Band successfully created!"
      redirect_to band_url(@band.id)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :new
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band
      render :show
    else
      flash[:errors] = "Band not found"
      redirect_to :index
    end
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band && @band.update(band_params)
      flash[:success] = "Band information successfully updated!"
      redirect_to band_url(@band.id)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band.nil?
        flash[:errors] = "Band not found"
    end
    if @band && @band.destroy
      flash[:success] = "Band successfully removed from database!"
      redirect_to :index #perhaps add a confirmation page in the future
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to :index
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
