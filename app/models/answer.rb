class Answer < ActiveRecord::Base
  validates_presence_of :description
  validates_length_of :description, :minimum => 50

  belongs_to :question
end
