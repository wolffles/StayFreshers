class TestSet < ApplicationRecord
  belongs_to :user
  has_many :multiple_choices, dependent: :destroy
  has_many :true_falses, dependent: :destroy
  has_many :flashcards, dependent: :destroy
  validates :name, presence: true
end
