# == Schema Information
#
# Table name: participants
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  convention_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_participants_on_convention_id  (convention_id)
#  index_participants_on_user_id        (user_id)
#

require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
