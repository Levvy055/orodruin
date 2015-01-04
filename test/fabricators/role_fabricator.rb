# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string           indexed, indexed => [resource_type, resource_id]
#  resource_id   :integer          indexed => [name, resource_type]
#  resource_type :string           indexed => [name, resource_id]
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_roles_on_name                                    (name)
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#

Fabricator(:role) do
end
