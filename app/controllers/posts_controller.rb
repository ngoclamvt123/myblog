class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:sort] == "asc"
      @posts = Post.all.order(created_at: :ASC)
    else
      @posts = Post.all.order(created_at: :DESC)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created!"
    else
      render "new"
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
