module Ahoy
  class Event < ActiveRecord::Base
    self.table_name = 'ahoy_events'

    belongs_to :visit
    belongs_to :user

    serialize :properties, JSON
  end
end

# == Schema Information
#
# Table name: ahoy_events
#
#  id         :uuid             not null, primary key
#  visit_id   :uuid             indexed
#  user_id    :integer          indexed
#  name       :string
#  properties :text
#  time       :datetime         indexed
#
# Indexes
#
#  index_ahoy_events_on_time      (time)
#  index_ahoy_events_on_user_id   (user_id)
#  index_ahoy_events_on_visit_id  (visit_id)
#
