class TrueFalse < ApplicationRecord
  belongs_to :test_set

  validates :question, presence: true
  
end
