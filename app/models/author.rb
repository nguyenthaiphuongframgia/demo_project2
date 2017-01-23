class Author < ApplicationRecord
  has_many :book_items, dependent: :destroy

  mount_uploader :image, PictureUploader

  validates :name, presence: true, length: {maximum: Settings.maximum.name},
    uniqueness: true
  validates :description, presence: true,
    length: {maximum: Settings.maximum.description}

  scope :all_except, ->user {where.not id: user}

  def self.to_xls
    CSV.generate do |csv|
      csv << [I18n.t("admin.authors.index"), I18n.t("admin.authors.author_name"),
        I18n.t("admin.authors.description")]
      all.each do |author|
        csv << [author.id, author.name, author.description]
      end
    end
  end
end
