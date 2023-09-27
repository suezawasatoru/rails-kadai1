class Event < ApplicationRecord
  validates :title, presence: true, length:{maximum: 20}
  validates :schedule_memo, length:{maximum: 500}
  validate :start_end_check

  def start_end_check

    @input = "を入力してください"

    if start_date == nil && end_date == nil
      errors.add(:start_date,@input) 
      errors.add(:end_date,@input)
    elsif end_date == nil
      errors.add(:end_date,@input)
    elsif start_date == nil
      errors.add(:start_date,@input)
    elsif start_date > end_date
      errors.add(:end_date,"は開始日よりも後の日付#{@input}")
    end
  end
end
