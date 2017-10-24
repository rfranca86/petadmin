class ScheduleStatus < ApplicationRecord
  belongs_to :service
  enum status: { Done: 0, Canceled: 1, Waiting: 2}

  validates :service, :status, :date, presence: true
end
