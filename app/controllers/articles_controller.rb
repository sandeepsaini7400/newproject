class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "saini", password: "12345", except: [:index, :show]

  # before_action :require_login, on: [:update, :destroy]

  # after_action :require_login, on:[:update, :destroy, :new]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create

    @user = User.find(params[:article_id])
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  
  # def require_login
  #    puts "You must be logged in to access this section"
  # end

  # def require_log
  #   Puts "you are logged it"
  # end 


  private 
  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
