class ArticlesController < ApplicationController
  before_action :set_article , only: [:edit , :update , :show , :destroy]
  before_action :require_user, except: [:index, :show, :pricefilter,:apply_price_filter]
  before_action :require_same_user, only: [:edit, :update, :destroy]

 

  def index
    if current_user && current_user.admin
    @articles = Article.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    else
    @articles = Article.where(:isactive=>true).paginate(page: params[:page], per_page: 5).order('created_at DESC')
   end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
     if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)    

    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
   
   if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
   else
      render 'edit'
   end
 end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  def active
    @article = Article.find(params[:id])
    @article.update(isactive: !@article.isactive)
    redirect_to articles_path
  end
  
  def pricefilter
    
  end

  def apply_price_filter
    @articles = Article.in_price_range(params[:min_value], params[:max_value]).paginate(page: params[:page], per_page: 5).order('created_at DESC')
    render '/articles/index'
  end

  
  private 
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:ProductName,:description,:price)
  end
   
  def require_same_user
    if current_user != @article.user and !current_user.admin?
     flash[:danger] = "You can only edit or delete your own articles"
     redirect_to root_path
    end
  end
end
