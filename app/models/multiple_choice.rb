class MultipleChoice < ApplicationRecord
  belongs_to :test_set

  validates :question, presence: true
  validates :correct_answer, presence: true
  validate :must_match
  validate :no_duplicates
  validates :a, presence: true
  validates :b, presence: true
  validates :c, presence: true
  validates :d, presence: true

  def must_match
    if matches(correct_answer, [a,b,c,d]) != 1
      errors.add(:correct_answer, 'Must match one and only one answer')
    end
  end

  def no_duplicates
    errors.add('cannot have same answers') if [a,b,c,d] & [a,b,c,d] != [a,b,c,d]
  end


  def matches(correct_answer, array)
    array.select{|x| x == correct_answer}.count
  end
end
