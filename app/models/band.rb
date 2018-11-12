class Band < ApplicationRecord
  belongs_to :user
  has_many :jam_sessions
  has_many :users, through: :jam_sessions
  validates :name, uniqueness: true, presence: true
  validates :genre, presence: true
  mount_uploader :photo, PhotoUploader
end
