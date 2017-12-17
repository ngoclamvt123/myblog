class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(content: params[:comment][:content], user: current_user)
    unless comment.save
      flash[:alert] = "Comment can't be blank!"
    end
    redirect_to post_path(post)
  end

end
