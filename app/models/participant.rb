class Participant < ActiveRecord::Base
  rolify

  belongs_to :user
  belongs_to :convention

  validates :convention, presence: true
end

# == Schema Information
#
# Table name: participants
#
#  id            :integer          not null, primary key
#  user_id       :integer          indexed
#  convention_id :integer          indexed
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_participants_on_convention_id  (convention_id)
#  index_participants_on_user_id        (user_id)
#
