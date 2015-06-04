class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post), notice: 'Commentário cadastrado com sucesso.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
