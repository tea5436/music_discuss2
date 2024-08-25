class PostsController < ApplicationController
  def new
    @post = Post.new
  end 

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end 
  end 

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to posts_path
    end 
    
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to posts_path
    end 
    
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end 
  end 
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to homes_about_path
  end
  
  private
  
  
  def post_params
    params.require(:post).permit(:image, :title, :body)
  end 
end
