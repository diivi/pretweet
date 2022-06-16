class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    return if tweet.publish_at > Time.current

    tweet.publish!
  end
end
