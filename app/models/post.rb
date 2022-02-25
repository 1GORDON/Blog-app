class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def show_recent_5_comments
    comments.limit(5).order(created_at: :desc)
  end

  after_save :update_post_counter

  def update_post_counter
    user.increment!(:posts_counter)
  end
end
