class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    if @comment = @post.comments.create(comment_params)
      redirect_to post_path(@post), notice: 'Commentário cadastrado com sucesso.'
    else
      redirect_to post_path(@post), notice: 'Não foi possível inserir o seu comentário. Verifique se o mesmo está em branco.'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
