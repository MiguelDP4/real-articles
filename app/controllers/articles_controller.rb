class ArticlesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy edit]

  def index
    if !search_params[:search_term].nil?
      @pagy, @articles = pagy(Article.search_article_by_title(search_params[:search_term]))
    elsif !params[:category_id].nil?
      @pagy, @articles = pagy(Category.find(params[:category_id]).articles)
    elsif !params[:author_id].nil?
      @pagy, @articles = pagy(User.find(params[:author_id]).articles)
    else
      @pagy, @articles = pagy(Article.all)
    end
  end

  def new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.image = 'default/no-image.jpg' if @article.image == ''
    if @article.save
      category_array = category_params[:category].split(',').uniq.map(&:to_i).compact
      category_array << 1 if category_array.count.zero?
      category_array.each { |category| @article.add_category(category) }
      flash[:success] = 'Your article was published.'
      redirect_to @article
    else
      flash[:danger] = 'Something went wrong. Try again later.'
      redirect_to request.referrer
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @categories = Category.all
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(edit_params)
    if @article.save
      redirect_to @article
    else
      flash[:danger] = 'Something went wrong. Try again later.'
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

  def edit_params
    params.require(:article).permit(:title, :text, :image)
  end

  def logged_in_user
    flash[:danger] = 'Log in first to be able to create articles.' unless user_signed_in?
    redirect_to new_user_session_url unless user_signed_in?
  end

  def search_params
    params.permit(:search_term)
  end
end
