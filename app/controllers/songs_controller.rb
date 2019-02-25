class SongsController < ApplicationController
  before_action :find_song, only: %i[show edit update]

  def new
    @song = Song.new
      end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      render 'new'
      msg = @song.errors.full_messages
      flash.now[:error] = msg
    end
  end

  def edit; end

  def update
    if @song.update(song_params)
      p 'song successfully updated'
      redirect_to song_path(@song)
    else
      msg = @song.errors.full_messages
      flash.now[:error] = msg
      redirect_back(fallback_location: root_path)
    end
end

  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 20)
  end

  def destroy
    @song = Song.find(params[:song_id])
    @song.destroy
end

  private

  def song_params
    params.require(:song).permit(:title, :performer, :notes)
  end

  def find_song
    @song = Song.find(params[:id])
 end
end
