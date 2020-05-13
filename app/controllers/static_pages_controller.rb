class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
  end
end
