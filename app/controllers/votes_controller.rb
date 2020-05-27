class VotesController < ApplicationController
  before_action :require_login

  def create
    article = Article.find(params[:id])
    if !current_user.voted?(article)
      vote = current_user.votes.build(user_id: current_user.id, article_id: params[:id])
      if vote.save
        flash[:success] = 'You voted for this article'
      else
        flash[:danger] = 'Something went wrong, try again later.'
      end
    else
      flash[:danger] = 'You already voted for this article'
    end
    redirect_to article
  end

  def destroy
    article = Article.find(params[:id])
    if current_user.voted?(article)
      vote = Vote.find_vote(current_user.id, article.id)
      if vote.delete
        flash[:dark] = 'You removed your vote'
      else
        flash[:danger] = 'Something went wrong, try again later.'
      end
    else
      flash[:danger] = "You haven't voted for this article, you can't remoe your vote"
    end
    redirect_to article
  end
end
