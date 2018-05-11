class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :body, length: { maximum: 500 }
end
