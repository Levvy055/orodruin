class Auth::Application < ActiveRecord::Base
end

# == Schema Information
#
# Table name: auth_applications
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  uid          :uuid             not null, indexed, indexed => [secret]
#  secret       :string           not null, indexed => [uid]
#  redirect_uri :string           not null
#  owner_id     :integer          indexed
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_auth_applications_on_owner_id        (owner_id)
#  index_auth_applications_on_uid             (uid)
#  index_auth_applications_on_uid_and_secret  (uid,secret)
#
