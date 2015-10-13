class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    respond_to do |f|
      f.html
      f.transit do
        render transit: @posts, verbose: params[:verbose]
      end
      f.json do
        render json: @posts
      end
    end
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    success = @post.save
    respond_to do |format|
      format.html do
        if success
          redirect_to posts_url, notice: 'Post was successfully created.'
        else
          render :new
        end
      end
      format.transit do
        val =  Transit::Reader.new(:json, request.body).read
        render transit: val
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    success = @post.update_attributes(post_params)
    respond_to do |format|
      format.html do
        if success
          redirect_to posts_url, notice: 'Post was successfully updated.'
        else
          render :edit
        end
      end
      format.transit do
        render transit: @post
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :published_at, :text)
  end
end
