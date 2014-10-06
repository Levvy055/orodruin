class Convention < ActiveRecord::Base
  has_many :participations, dependent: :destroy
end
