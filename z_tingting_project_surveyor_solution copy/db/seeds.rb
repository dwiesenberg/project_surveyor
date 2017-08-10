puts 'Destroying everything...'
Option.destroy_all
Question.destroy_all
Survey.destroy_all
puts 'DONE'

puts 'Creating surveys...'
3.times do
  Survey.create(
    title: Faker::LordOfTheRings.character,
    description: Faker::Hipster.sentence)
end
puts 'DONE'

puts 'Creating questions...'
Survey.all.each do |survey|
  rand(1..5).times do
    Question.create(
      content: Faker::Hipster.sentence,
      question_type: 'Multiple Choice',
      survey_id: survey.id,
      required: false,
      num_options: 2,
      one_selection: true
      )
  end
end
puts "DONE"

puts 'Creating options...'
Question.all.each do |question|
  question.num_options.times do
    Option.create(
      question_id: question.id,
      content: Faker::Pokemon.location
      )
  end
end
puts 'DONE'

