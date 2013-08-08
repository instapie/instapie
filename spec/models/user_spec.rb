require 'spec_helper'

describe User do
  fixtures(:users)

  describe '#questions_count' do
    it 'increments whenever the user asks a new question' do
      dan = users(:dan)

      lambda do
        dan.questions.create(:question => "Who's your favorite Avenger?")
        dan.reload
      end.should change(dan, :questions_count).by(1)
    end
  end
end
