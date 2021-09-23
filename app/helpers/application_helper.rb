# frozen_string_literal: true

module ApplicationHelper
  def like_or_dislike_btn(tweet)
    like = Like.find_by(tweet: tweet, user: current_user)
    if like
      link_to('Dislike!', tweet_like_path(id: like.id, tweet_id: tweet.id), method: :delete,
                                                                            class: 'button is-small is-rounded is-danger is-light')
    else
      link_to('Like!', tweet_likes_path(tweet_id: tweet.id), method: :post,
                                                             class: 'button is-small is-rounded is-danger')
    end
  end
end
