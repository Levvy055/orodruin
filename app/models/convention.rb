class Convention < ActiveRecord::Base
  has_many :participations, dependent: :destroy
end

# == Schema Information
#
# Table name: conventions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start      :date
#  finish     :date
#  created_at :datetime
#  updated_at :datetime
#
