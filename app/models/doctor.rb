class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :visiting_days, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :reviews, dependent: :destroy
  has_one :address, dependent: :destroy
  belongs_to :specialization

  validates :full_name, :email, presence: true

  def specialization_name(spec_id)
    Specialization.find_by_id(spec_id).name
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:rating).round(2)
  end

  def last_five_reviews
    reviews.limit(5).order(created_at: :desc)
  end

  def has_active_card?
    active.present?
  end

  def filled_required_fields?
    specialization.present? && experience.present? && bio.present? &&
    address.present? && price.present? && phone_number.present?
  end
end
