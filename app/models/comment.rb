class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true, length: {maximum: Settings.maximum.content}
  validates :user_id, presence: true
  validates :book_id, presence: true
end
