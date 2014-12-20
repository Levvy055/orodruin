# Internal: Participant role in convention
#
# Available roles:
#
# - admin
# - writer
# - volunteer
# - moderator
# - organisator
class Role < ActiveRecord::Base
  # rubocop:disable HasAndBelongsToMany
  has_and_belongs_to_many :participants, join_table: :participants_roles
  belongs_to :resource, polymorphic: true

  scopify
end

# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string(255)      indexed, indexed => [resource_type, resource_id]
#  resource_id   :integer          indexed => [name, resource_type]
#  resource_type :string(255)      indexed => [name, resource_id]
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_roles_on_name                                    (name)
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#
