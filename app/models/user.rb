class User < ApplicationRecord
  has_one_attached :icon

  def icon
    '/images/profile/default-icon.png'
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: {maximum: 50}


end
