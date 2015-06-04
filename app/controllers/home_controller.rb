class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user).last_posts.page(params[:page]).per(10)
  end
end
