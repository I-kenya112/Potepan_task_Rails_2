class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
end

def reserve_days
  (self.reserve_end - self.reserve_start).to_i
end

def reserve_total
  (reserve_people * reserve_days * reserve_price).to_i
end