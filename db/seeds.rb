# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Goals, submission, questions, quizzes, users'
Goal.delete_all
Submission.delete_all
Question.delete_all
Quiz.delete_all
User.delete_all

psychiatrist = User.create!(
  email: 'bob@gmail.com',
  password: 'p123456',
  name: 'Bob',
  age: 40,
  admin: true
)

user = User.create!(
  email: 'user@user.com',
  password: '123456',
  name: 'José',
  age: 35,
  admin: false
)

quiz1 = Quiz.create!(title: 'Capitals')
questions_data1 = [
  {
    content: "What is the capital of France?",
    answer1: "Berlin",
    answer2: "Madrid",
    answer3: "Paris",
    answer4: "London",
    correct_answer: 3
  },

  {
    content: "What is the capital of Brazil?",
    answer1: "Brasília",
    answer2: "São Paulo",
    answer3: "Rio de Janeiro",
    answer4: "Buenos Aires",
    correct_answer: 1
  },

  {
    content: "What is the capital of Germany?",
    answer1: "Madrid",
    answer2: "Amsterdam",
    answer3: "Munich",
    answer4: "Berlin",
    correct_answer: 4
  },

  {
    content: "What is the capital of Japan?",
    answer1: "Shangai",
    answer2: "Tokyo",
    answer3: "Osaka",
    answer4: "Seoul",
    correct_answer: 2
  },

  {
    content: "What is the capital of Australia?",
    answer1: "Sydney",
    answer2: "Canberra",
    answer3: "Melbourne",
    answer4: "Perth",
    correct_answer: 2
  }
]

questions_data1.each do |question_data|
  quiz1.questions.create!(question_data)
end


quiz2 = Quiz.create!(title: 'Simple Math')
questions_data2 = [
  {
    content: "How much is 100 * 100?",
    answer1: "1.000.000",
    answer2: "10.000",
    answer3: "100.000",
    answer4: "1.000",
    correct_answer: 2
  },

  {
    content: "How much is 2 square?",
    answer1: "8",
    answer2: "2",
    answer3: "4",
    answer4: "6",
    correct_answer: 2
  },

  {
    content: "How much is 20 / 4?",
    answer1: "8",
    answer2: "6",
    answer3: "5",
    answer4: "10",
    correct_answer: 3
  },

  {
    content: "10 + 10 * 10?",
    answer1: "110",
    answer2: "200",
    answer3: "1.100",
    answer4: "1.200",
    correct_answer: 1
  },

  {
    content: "5 * 5?",
    answer1: "25",
    answer2: "50",
    answer3: "55",
    answer4: "5",
    correct_answer: 1
  }
]

questions_data2.each do |question_data|
  quiz2.questions.create!(question_data)
end


quiz3 = Quiz.create!(title: "Who Invented It?")
questions_data3 = [
  {
    content: "Who is credited with inventing the light bulb?",
    answer1: "Nikola Tesla",
    answer2: "Isaac Newton",
    answer3: "Albert Einstein",
    answer4: "Thomas Edison",
    correct_answer: 4
  },
  {
    content: "Who is known for inventing the telephone?",
    answer1: "Alexander Graham Bell",
    answer2: "Guglielmo Marconi",
    answer3: "John Logie Baird",
    answer4: "Eli Whitney",
    correct_answer: 1
  },
  {
    content: "Who invented the first practical airplane?",
    answer1: "Henry Ford",
    answer2: "Orville and Wilbur Wright",
    answer3: "Samuel Morse",
    answer4: "Karl Benz",
    correct_answer: 2
  },
  {
    content: "Who invented the World Wide Web?",
    answer1: "Bill Gates",
    answer2: "Steve Jobs",
    answer3: "Alan Turing",
    answer4: "Tim Berners-Lee",
    correct_answer: 4
  },
  {
    content: "Who invented dynamite?",
    answer1: "Alfred Nobel",
    answer2: "James Watt",
    answer3: "Robert Oppenheimer",
    answer4: "Richard Feynman",
    correct_answer: 1
  }
]

questions_data3.each do |question_data|
  quiz3.questions.create!(question_data)
end


quiz4 = Quiz.create!(title: "Band Vocalists")

questions_data4 = [
  {
    content: "Who is the lead vocalist of the band Queen?",
    answer1: "Robert Plant",
    answer2: "Freddie Mercury",
    answer3: "Axl Rose",
    answer4: "Mick Jagger",
    correct_answer: 2
  },
  {
    content: "Who is the lead singer for the band U2?",
    answer1: "Bono",
    answer2: "Roger Daltrey",
    answer3: "Steven Tyler",
    answer4: "Bruce Springsteen",
    correct_answer: 1
  },
  {
    content: "Which band was fronted by Kurt Cobain?",
    answer1: "Pearl Jam",
    answer2: "Foo Fighters",
    answer3: "Soundgarden",
    answer4: "Nirvana",
    correct_answer: 4
  },
  {
    content: "Who was the main vocalist of The Doors?",
    answer1: "Jim Morrison",
    answer2: "John Lennon",
    answer3: "Elton John",
    answer4: "David Bowie",
    correct_answer: 1
  },
  {
    content: "Which artist is associated with the band 'No Doubt'?",
    answer1: "Alanis Morissette",
    answer2: "Sheryl Crow",
    answer3: "Gwen Stefani",
    answer4: "Avril Lavigne",
    correct_answer: 3
  }
]

questions_data4.each do |question_data|
  quiz4.questions.create!(question_data)
end


quiz5 = Quiz.create!(title: "History")

# Questions about general history
questions_data5 = [
  {
    content: "Who was the first president of the United States?",
    answer1: "Benjamin Franklin",
    answer2: "George Washington",
    answer3: "Thomas Jefferson",
    answer4: "John Adams",
    correct_answer: 2
  },
  {
    content: "Which civilization is known for building pyramids?",
    answer1: "Greek",
    answer2: "Roman",
    answer3: "Egyptian",
    answer4: "Babylonian",
    correct_answer: 3
  },
  {
    content: "In which year did World War II end?",
    answer1: "1940",
    answer2: "1942",
    answer3: "1945",
    answer4: "1948",
    correct_answer: 3
  },
  {
    content: "What was the main reason for the fall of the Roman Empire?",
    answer1: "Natural disasters",
    answer2: "Alien invasion",
    answer3: "Economic instability and external threats",
    answer4: "The invention of the printing press",
    correct_answer: 3
  },
  {
    content: "Who discovered America in 1492?",
    answer1: "Marco Polo",
    answer2: "Christopher Columbus",
    answer3: "Ferdinand Magellan",
    answer4: "Vasco da Gama",
    correct_answer: 2
  }
]

questions_data5.each do |question_data|
  quiz5.questions.create!(question_data)
end

Goal.create!(
  title: 'Drink more water',
  description: 'At least 2 liters a day!'
)

Goal.create!(
  title: 'Eat more veggies',
  description: 'The greener the better!'
)

Goal.create!(
  title: 'Run for your life',
  description: '5 km a day keeps de doctor away!'
)

Goal.create!(
  title: 'Drink herbal tea',
  description: 'Less caffeine, more endorfine'
)

Goal.create!(
  title: 'Breather deeper',
  description: 'Pay attention to your breathe!'
)

Goal.create!(
  title: 'Get more sun',
  description: 'It will not be here in winter'
)

Goal.create!(
  title: 'Meditate',
  description: '10 minutes a day'
)
