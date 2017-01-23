require "csv"
class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :comments

  mount_uploader :avatar, PictureUploader

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :phone, presence: true, length: {maximum: Settings.maximum.phone}

  enum role: [:user, :manager, :admin]

  devise :database_authenticatable, :registerable, :validatable, :recoverable, :rememberable,
    :trackable, :omniauthable, :omniauth_providers => [:facebook]

  scope :all_except, ->user {where.not id: user}

  scope :by_search_user, ->start_day, end_day do
    where "created_at >= '#{start_day}' AND created_at <= '#{end_day}'" if start_day.present? and end_day.present?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def group_by_user
    created_at.to_date.to_s(:db)
  end

  def self.to_xls
    CSV.generate do |csv|
      csv << [I18n.t("index"), I18n.t("user_name"), I18n.t("email"),
        I18n.t("joined_date"), I18n.t("is_admin")]
      all.each do |user|
        csv << [user.id, user.name, user.email,
          user.created_at.to_date, user.is_admin]
      end
    end
  end

  def follow other_user
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following? other_user
    following.include?(other_user)
  end

 # Unfollows a user.

 # Returns true if the current user is following the other user

 def like_book book
   likes.create book_id: book.id
 end

 def unlike_book book
   likes.find_by(book_id: book.id).destroy if liked? book
 end

 def liked? book
   likes.find_by(book_id: book.id).present?
 end

 def is_user? user
    self == user
  end
end
