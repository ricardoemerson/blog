# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, -> { includes :user }, dependent: :delete_all

  scope :last_posts, -> { order(created_at: :desc) }
  validates :title, :content, presence: true
end
