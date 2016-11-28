class BookmarksController < ApplicationController
  # before_action :find_movie, only: :index

  def index
    @ms = []
    bms= current_user.bookmarks
    bms.each do |bm|
      @ms << bm.movie
    end
    # @ms = Movie.all
    @ms = Kaminari.paginate_array(@ms).page(params[:page]).per(8)
  end

  def create
    @bookmark = Bookmark.where(:user_id => current_user.id).where(:movie_id =>params['movie_id'])
    if(@bookmark.any?)
      # @bookmark.first.delete
      # Bookmark.destroy("user_id=? and movie_id=?",current_user.id, params['movie_id'])
      Bookmark.destroy_by_movie_id_and_user_id(params['movie_id'],current_user.id)
    else
      bookmark = Bookmark.new
      bookmark.user_id=current_user.id
      bookmark.movie_id = params['movie_id']
      bookmark.save
    end
  end
  def destroy
  end
end
