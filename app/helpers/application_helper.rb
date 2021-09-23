# frozen_string_literal: true

module ApplicationHelper
  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

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
