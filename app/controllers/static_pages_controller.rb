class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
    if @articles.none?
      flash.now[:warning] = 'Looks like nobody has published anything yet. Be the first one to create an article!'
    end
  end
end
