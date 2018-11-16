class Band < ApplicationRecord
  belongs_to :user
  has_many :jam_sessions
  has_many :users, through: :jam_sessions
  validates :name, presence: true
  validates :genre, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
