class Task < ApplicationRecord

	belongs_to :creator, foreign_key: "creator_id", class_name: "User"
	has_many :activities
	has_many :users, through: :user_tasks
  has_many :user_tasks

	enum status: [:pending, :in_progress, :completed]

  validates :status, inclusion: { in: Task.statuses.keys }
  validates :name, presence: true


  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :planned_hours, presence: true
  validates :status, presence: true
  validates :creator_id, presence: true
  validates :name, presence: true

end
