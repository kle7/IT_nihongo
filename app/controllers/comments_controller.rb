class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build comment_params
    @movie = Movie.find_by id: @comment.movie_id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      flash[:danger] = t "flash.fail"
      redirect_to :back
    end
  end

  def destroy
    @comment = current_user.comments.find_by id: params[:id]
    @movie = @comment.movie
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit :content, :movie_id  
    end
end
