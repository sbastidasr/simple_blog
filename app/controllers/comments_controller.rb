class CommentsController < ApplicationController
  def create

    if params[:article_id]
      @commentable = Article.find(params[:article_id])
    else
      @commentable = Post.find(params[:post_id])
    end

    @comment = @commentable.comments.create!(comment_params)
    respond_to do |format|
      format.html { redirect_to @commentable }
      format.js
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body, :user)
  end

end
