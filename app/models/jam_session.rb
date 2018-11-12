class JamSession < ApplicationRecord
  belongs_to :user
  belongs_to :band
  validates :status, presence: true
end
