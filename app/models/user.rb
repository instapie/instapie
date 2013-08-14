class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :answers

  validates_presence_of :name
  validates_presence_of :email

  def ask_question(question, description, options)
    self.transaction do
      q = self.questions.create!(:question => question, :description => description)
      options.each do |option|
        q.options.create!(:option => option)
      end
      return q
    end
  end

  def answer_question(question, option_id)
    question.answers.create!(:user => self, :option_id => option_id)
  end
end
