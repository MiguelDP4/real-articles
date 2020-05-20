class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
    @categories = Category.all.sort_by(&:priority)
    string_message = 'Looks like nobody has published anything yet. Be the first one to create an article!'
    flash.now[:warning] = string_message if @articles.none?
  end
end
