class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ edit update destroy ]
  before_action :store_user_return_to, only: [:random]

  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "投稿しました" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "投稿を更新しました" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "投稿を削除しました" }
      format.json { head :no_content }
    end
  end

  def random
    @post = Post.order(Arel.sql('RANDOM()')).first
  end

  def my_posts
    @posts = current_user.posts.order(created_at: :desc).page(params[:page])
  end

  def search
    if params[:eaten].present? || params[:smell].present? || params[:sound].present? || params[:spill].present? || params[:category].present?
      @posts = Post.all.order(created_at: :desc).page(params[:page])
      @posts = @posts.where(eaten: params[:eaten] == '1') if params[:eaten].present?
      @posts = @posts.where(smell: params[:smell] == '1') if params[:smell].present?
      @posts = @posts.where(sound: params[:sound] == '1') if params[:sound].present?
      @posts = @posts.where(spill: params[:spill] == '1') if params[:spill].present?
      @posts = @posts.where(category: params[:category]) if params[:category].present?
    end
  end

  private

    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def filter_params
      params.slice(:eaten, :smell, :sound, :spill, :category)
    end

    def store_user_return_to
      session[:user_return_to] = posts_random_url if current_user.nil?
    end

    def post_params
      params.require(:post).permit(:title, :body, :image, :category, :eaten, :smell, :sound, :spill)
    end
end
