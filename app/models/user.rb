class User < ApplicationRecord
  has_many :rooms
  has_many :reservations

  has_one_attached :icon

  def icon_url
    if icon.attached?
      icon.variant(resize: "400x300").processed
    else
      default_icon_url
    end
  end

  def default_icon_url
    'default-icon.png'
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: {maximum: 50}

end
