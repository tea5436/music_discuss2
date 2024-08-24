class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end 
    
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
    
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end 
  
  def withdrawal
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end 
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
