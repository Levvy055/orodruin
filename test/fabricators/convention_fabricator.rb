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

Fabricator(:convention) do
  name 'TestiCon'
  start  { Date.tommorow  }
  finish { start + 3.days }
end
