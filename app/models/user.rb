class User < ApplicationRecord
  include Clearance::User

  has_many :posts

  validates :first_name, :last_name, presence: true, length: { in: 2..30 }
  validates :password, length: { in: 6..64 }
end
