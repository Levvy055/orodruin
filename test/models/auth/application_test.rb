# == Schema Information
#
# Table name: auth_applications
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  uid          :uuid             not null
#  secret       :string           not null
#  redirect_uri :string           not null
#  owner_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_auth_applications_on_owner_id        (owner_id)
#  index_auth_applications_on_uid             (uid)
#  index_auth_applications_on_uid_and_secret  (uid,secret)
#

require 'test_helper'

describe Auth::Application do
  let(:application) { Auth::Application.new }

  it 'must be valid' do
    application.must_be :valid?
  end
end
