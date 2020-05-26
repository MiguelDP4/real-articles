module VotesHelper
  def vote_button(article)
    return unless user_signed_in?

    if !current_user.voted?(article)
      link_to('', "/articles/#{article.id}/vote", method: :post, class: 'btn btn-outline-secondary fa fa-caret-square-o-up ml-2 mb-2')
    else
      link_to('', "/articles/#{article.id}/unvote", method: :patch, class: 'btn btn-secondary fa fa-caret-square-o-down ml-2 mb-2')
    end
  end
end
