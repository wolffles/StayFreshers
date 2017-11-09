class Flashcard < ApplicationRecord
  belongs_to :test_set

  #validate raises errors if parameters aren't met
  validates :question, presence: true
  validates :description, presence:true
end
