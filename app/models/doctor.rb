class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :visiting_hours
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :specialization

  def specialization_name(spec_id)
    Specialization.find_by_id(spec_id).name
  end
end
