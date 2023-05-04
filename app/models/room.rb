class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  has_one_attached :room_image

  validates :room_name, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[room_name room_address room_intro]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[reservations room_image_attachment room_image_blob user]
  end

end
