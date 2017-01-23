class BookItem < ApplicationRecord
  belongs_to :author
  belongs_to :book

  validates :author_id, presence: true
  validates :book_id, presence: true
end
