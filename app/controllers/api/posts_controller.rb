class Api::PostsController < ApplicationController

  def index
    if params[:search].present?
      posts = Post.search(params[:search])
    else
      posts = Post.all
    end
      render json: posts, status: :ok
  end
  

end
