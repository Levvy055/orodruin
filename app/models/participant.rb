class Participant < ActiveRecord::Base
  rolify

  belongs_to :user
  belongs_to :convention

  validates :convention, presence: true
end
