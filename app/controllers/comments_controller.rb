class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]

  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(comment_params[:post_id])

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to post_path(@post), status: :unprocessable_entity }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_comment", partial: "comments/form", locals: { post: @post, comment: @comment }) }
        format.html { render "posts/show", status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = @comment.post
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
      format.html { redirect_to post_path(@post), notice: "コメントを削除しました。" }
    end
  end

  private

  def set_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
