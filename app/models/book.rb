class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :request_items, dependent: :destroy
  has_many :book_items, dependent: :destroy
  has_many :authors, through: :book_items

  ratyrate_rateable 'visual_effects', 'original_score'
  
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :book_items
  accepts_nested_attributes_for :authors

  validates :title, presence: true, length: {maximum: Settings.maximum.name}
  validates :description, presence: true,
    length: {maximum: Settings.maximum.description}
  validates :category_id, presence: true
  validates :publisher_id, presence: true

  scope :book_order, -> {order "created_at desc"}

  scope :by_search_book, ->start_day, end_day do
    where "created_at >= '#{start_day}' AND created_at <= '#{end_day}'" if start_day.present? and end_day.present?
  end

  def group_by_book
    created_at.to_date.to_s(:db)
  end

  def get_author id
    @name = Author.find_by id: id
    if @name.nil?

    else
      @name.name
    end
  end

  def self.to_xls
    csv_data = CSV.generate do |csv|
      csv << [I18n.t("admin.books.index"), I18n.t("admin.books.book_title"), I18n.t("admin.books.category_name"),
        I18n.t("admin.books.author_name"), I18n.t("admin.books.publisher_name")]
      all.each do |book|
        csv << [book.id, book.title, book.category.name,
          book.publisher.name]
      end
    end
  end
end
