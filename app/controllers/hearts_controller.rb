class HeartsController < ApplicationController
  respond_to :js

  def like
    @user = current_user
    @post = Post.find(params[:post_id])
    if @post.user != current_user
      @user.heart!(@post)
    end
  end

  def unlike
    @user = current_user
    @heart = @user.hearts.find_by_post_id(params[:post_id])
    @post = Post.find(params[:post_id])
    @heart.destroy!
  end
end
