class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :address, presence: true, length: {maximum: Settings.maximum.address}
  validates :email, presence: true, length: {maximum: Settings.maximum.email}
  validates :phone, presence: true, length: {maximum: Settings.maximum.phone}
  validates :description, presence: true, length: {maximum:
    Settings.maximum.description}

  scope :all_except, ->user {where.not id: user}

  def self.to_xls
    CSV.generate do |csv|
      csv << [I18n.t("admin.publishers.index"), I18n.t("admin.publishers.name"),
        I18n.t("admin.publishers.description"), I18n.t("admin.publishers.quantity")]
      all.each do |publisher|
        csv << [publisher.id, publisher.name, publisher.description]
      end
    end
  end
end
