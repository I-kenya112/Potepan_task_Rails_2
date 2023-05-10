class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :reserve_start, presence: true
  validates :reserve_end, presence: true

  validate :start_date_not_past
  validate :end_date_after_start_date

  def start_date_not_past
    return if reserve_start.blank?

    if reserve_start < Date.today
      errors.add(:reserve_start, "は過去の日付を選択することはできません")
    end
  end

  def end_date_after_start_date
    if reserve_end.present? && reserve_start.present? && reserve_end <= reserve_start
      errors.add(:reserve_end, "はチェックイン日よりも後の日付を選択してください")
    end
  end
end

