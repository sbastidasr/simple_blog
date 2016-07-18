class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body, :user)
  end

end
