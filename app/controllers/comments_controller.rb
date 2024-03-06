class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find_by(id: params[:id])

  end

  def update
    @comment = current_user.comments.find_by(id: params[:id])
    @post = @comment.post
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    @comment.destroy!
    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
