class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to my WebApp #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id]);
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id]);
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Account Updated Successfully"
      redirect_to articles_path

    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:username , :email , :password)
  end

  def require_current_user
    if current_user != User.find(current_user.id)
      flash[:danger] = "you are not allowed to do this :)"
      redirect_to users_path
    end
  end
end
