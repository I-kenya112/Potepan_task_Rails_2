class Room < ApplicationRecord
  belongs_to :user

  validates :room_name, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true

end
