# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
dan = User.create!({
  :name => 'Dan',
  :email => 'daniel.tao@gmail.com',
  :password => 'horsey',
  :password_confirmation => 'horsey'
})

question_data = [
  ["Who's your favorite Avenger?", [
    'Captain America',
    'Iron Man',
    'The Hulk',
    'Hawkeye',
    'Black Widow'
  ]],

  ['Which animal would win in a fight?', [
    'Bear',
    'Lion',
    'Tiger',
    'Gorilla'
  ]],

  ['Which is the best time travel movie?', [
    'Back to the Future',
    'Primer',
    'Looper',
    'Terminator 2',
    "Bill and Ted's Excellent Adventure"
  ]],

  ['Developers: What do you call yourself?', [
    'Developer',
    'Engineer',
    'Programmer',
    'Coder'
  ]]
]

question_data.each do |question, options|
  q = dan.questions.create!(:question => question)
  options.each do |option|
    q.options.create!(:option => option)
  end
end
