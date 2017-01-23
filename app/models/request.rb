class Request < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :by_status, ->status do
   where "status = #{status}" if status.present?
 end
end
