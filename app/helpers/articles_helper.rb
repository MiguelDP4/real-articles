module ArticlesHelper
  def text_reductor(text, max_length)
    if text.length > max_length
      text[0..max_length] + '...'
    else
      text[0..max_length]
    end
  end

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

  def show_categories(article)
    return_html = ''
    article.categories.each do |category|
      return_html += link_to(category.name, articles_path(params:
        { category: category.name, category_id: category.id }), class: 'badge badge-secondary')
    end
    return_html.html_safe
  end

  def edit_article_link(article)
    if current_user == article.user
      link_to('Edit my article', "/articles/#{article.id}/edit", class: "btn btn-secondary")
    end
  end
end
