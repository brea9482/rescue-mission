class Question < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description

  has_many :answers
end
