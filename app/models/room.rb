class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  has_one_attached :room_image

  validates :room_name, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true

  def room_image_url
    if icon.attached?
      icon.variant(resize: "400x300").processed
    else
      default_room_image_url
    end
  end

  def default_room_image_url
    'default-image-room.png'
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[room_name room_address room_intro]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[reservations room_image_attachment room_image_blob user]
  end

end
