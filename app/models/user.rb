class User < ApplicationRecord

  has_many :created_tasks, foreign_key: "creator_id", class_name: "Task"
  has_many :activities
  has_many :tasks, through: :user_tasks
  has_many :user_tasks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:manager, :employee]

  validates :role, inclusion: { in: User.roles.keys - ["manager"] }

end
