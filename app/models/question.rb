class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :title, length: { minimum: 2 }
  validates :body, length: { maximum: 500 }
  validates :user_id, presence: true
end
