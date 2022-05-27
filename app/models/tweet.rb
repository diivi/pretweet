class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, presence: true, length: { maximum: 140,minimum: 1 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  def published?
    tweet_id?
  end
end
