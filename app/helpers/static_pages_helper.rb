module StaticPagesHelper
  def most_popular_article
    vote_counts = Article.all.joins(:votes).group(:id).count
    top_articles = vote_counts.sort_by(&:last)
    if top_articles.count.positive?
      article_id = top_articles.last[0]
      Article.find(article_id)
    else
      Article.first
    end
  end
end
