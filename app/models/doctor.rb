class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :visiting_days
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :specialization

  def specialization_name(spec_id)
    Specialization.find_by_id(spec_id).name
  end
end
