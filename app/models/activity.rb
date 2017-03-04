class Activity < ApplicationRecord
	belongs_to :user
	belongs_to :task

  validates :duration, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :task_id, presence: true

end
