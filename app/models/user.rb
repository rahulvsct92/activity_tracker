class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:manager, :employee]

  validates :role, inclusion: { in: User.roles.keys - ["manager"] }
end
