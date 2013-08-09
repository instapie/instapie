class Question < ActiveRecord::Base
  belongs_to :user, :counter_cache => true

  has_many :options
  has_many :answers

  validates_presence_of :user_id
  validates_presence_of :question

  scope :latest, -> { order(:id => :desc) }
end
