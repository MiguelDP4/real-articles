class ArticlesController < ApplicationController
  before_action :require_login
  before_action :logged_in_user, only: [:create, :destroy, :edit]

  def new

  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Your article was published."
      redirect_to @article
    else
      flash[:danger] = "Something went wrong. Try again later. #{p article_params}"
      redirect_to root_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      flash[:danger] = "Something went wrong. Try again later."
      redirect_to root_path
    end
  end

  private

  def article_params
    params.permit(:title, :text, :image)
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Log in first to be able to create articles."
      redirect_to login_url
    end
  end
end
