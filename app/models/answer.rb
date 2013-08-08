class Answer < ActiveRecord::Base
  belongs_to :user,     :counter_cache => true
  belongs_to :question, :counter_cache => true
  belongs_to :option,   :counter_cache => true

  validates_presence_of :user_id
  validates_presence_of :question_id
  validates_presence_of :option_id
end
