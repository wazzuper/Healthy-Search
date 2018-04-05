class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :visiting_days
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :reviews
  belongs_to :specialization

  def specialization_name(spec_id)
    Specialization.find_by_id(spec_id).name
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:rating).round(2)
  end

  def last_five_reviews
    reviews.limit(5).order(created_at: :desc)
  end
end
