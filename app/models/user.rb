class User < ActiveRecord::Base

  has_many :statuses
  has_many :mentions

  has_many :follower_relationships, class_name: "Relationship", foreign_key: 'leader_id'
  has_many :leader_relationships, class_name: 'Relationship', foreign_key: 'follower_id'
  has_many :follower_users, through: :follower_relationships, source: :follower
  has_many :following_users, through: :leader_relationships, source: :leader

  has_secure_password validations: false

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def num_unread_mentions
    mentions.where(viewed_at: nil).count
  end

  def unread_mentions
    mentions.where(viewed_at: nil)
  end

  def mark_unread_mentions!
    unread_mentions.each do |mention|
      mention.mark_viewed!
    end
  end
end
