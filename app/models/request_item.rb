class RequestItem < ApplicationRecord
  belongs_to :request
  belongs_to :book

  validates :request_id, presence: true
  validates :book_id, presence: true
end
