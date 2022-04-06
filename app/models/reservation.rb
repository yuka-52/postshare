class Reservation < ApplicationRecord
    
    # バリデーションに関する記述
  validates :start_date,  presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true, numericality: true

    # 日付に関するバリデーション
  validate :start_check
  validate :start_end_check

    # 開始日が過去の場合に弾く
  def start_check
    errors.add(:start_date, 'は今日以降の日付を指定してください！') if
    start_date.nil? || start_date < Date.today
  end

    # 終了日が開始日より早い場合に弾く
  def start_end_check
    errors.add(:end_date, 'は開始日以降の日付を指定してください！') unless
    start_date.nil? || end_date.nil? || self.start_date < self.end_date
  end

  
  belongs_to :room
  belongs_to :user
 
end
