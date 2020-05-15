class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]

  def index
    @pagy, @articles = pagy(Article.all)
  end

  def new

  end

  def create
    @article = current_user.articles.build(article_params)
    # @categoryarticle = @article.category_articles.build(category_params)
    if @article.save
      category_array = category_params[:category].split(",").uniq.map { |category| category.to_i }.compact
      category_array << 1 if category_array.count == 0
      category_array.each{ |category| @article.add_category(category) }
      flash[:success] = "Your article was published."
      redirect_to @article
    else
      flash[:danger] = "Something went wrong. Try again later."
      redirect_to request.referrer
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

  def category_params
    params.permit(:category)
  end

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
