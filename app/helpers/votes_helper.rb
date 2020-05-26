module VotesHelper
  def vote_button(article)
    if user_signed_in?
      if !current_user.voted?(article)
        link_to('', @article, method: :post, class: "btn btn-outline-secondary fa fa-caret-square-o-up ml-2")
      else
        link_to('', @article, method: :patch, class: "btn btn-secondary fa fa-caret-square-o-down ml-2")
      end
    end
  end
end
