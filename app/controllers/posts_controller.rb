class PostsController < ApplicationController
  include ApplicationHelper
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_profile
  # GET /posts
  # GET /posts.json
  def index
    @post = Post.new
    if params[:query]
      @posts = Post.search(params[:query])
    else
      @posts = Post.feed(current_user)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.profile = current_user.profile
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        #form is at top of index view so the index view must be rendered if failed to create
        @posts = Post.feed(current_user)
        format.html { render :index}
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.'}
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :post_text)
    end
end
