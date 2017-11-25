User.create!(
email: "wolfgang.truong@gmail.com",
password: "password"
)

User.create!(
email: "wolfie.truong@gmail.com",
password: "password"
)
5.times do
  User.create!(
  email: Faker::Hipster.word + "@mail.com",
  password: "password"
  )
end

users = User.all

users.each{ |user|
  TestSet.create!(
    user: user,
    name: Faker::Overwatch.location,
    subject: Faker::Overwatch.quote
  )
  20.times do
    Note.create!(
      user: user,
      subject: Faker::Hipster.words(2).join(' '),
      body: Faker::Hipster.paragraphs(3).join(' ')
    )
  end
}

test_sets = TestSet.all

test_sets.each{|test_set|
  20.times do
    Flashcard.create!(
      question: Faker::RickAndMorty.location,
      description: Faker::RickAndMorty.quote,
      test_set: test_set
    )
  end
  20.times do
    MultipleChoice.create!(
      test_set: test_set,
      question: Faker::RickAndMorty.location,
      correct_answer: "a is correct",
      a: "a is correct",
      b: Faker::RickAndMorty.character,
      c: Faker::GameOfThrones.character,
      d: Faker::HarryPotter.character
    )
  end
  20.times do
    TrueFalse.create!(
      test_set: test_set,
      question: "always true" + Faker::Food.spice,
      correct_answer: true
    )
  end
}

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Flashcard.count} flashcards created"
puts "#{MultipleChoice.count} multiple choices created"
puts "#{TrueFalse.count} true false created"
puts "#{Note.count} notes created"
