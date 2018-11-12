class User < ApplicationRecord
  has_many :jam_sessions
  has_many :bands, through: :jam_sessions
  has_many :bands
  validates :name, presence: true
  validates :instrument, presence: true
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
