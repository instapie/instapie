# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
def create_user(name, password)
  User.create!({
    :name => name,
    :email => "#{name.downcase}@instapie.net",
    :password => password,
    :password_confirmation => password
  })
end

dan    = create_user('Dan', 'horsey')
adam   = create_user('Adam', 'donkey')
lauren = create_user('Lauren', 'monkey')
happy  = create_user('Happy', 'dolphin')

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

users = User.all

question_data.each do |question, options|
  asker = users.sample

  q = asker.ask_question(question, nil, options)
  puts "#{asker.name} asked: #{question}"

  (users - [asker]).each do |user|
    o = q.options.sample
    user.answer_question(q, o.id)
    puts "  #{user.name} answered: #{o.option}"
  end
end
