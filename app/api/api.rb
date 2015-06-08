class API < Grape::API
  version 'v1.0', using: :header, vendor: 'orodruin'

  default_format :json
  format :json

  helpers do
    def present(object, options = {})
      serializer = options.fetch(:serializer) do
        ActiveModel::Serializer.serializer_for(object)
      end
      serialized = serializer.new(object)
      serialized.root = options.fetch(:root) do
        if object.is_a?(ActiveRecord::Relation)
          object.model.name.underscore.pluralize.tr('/', '_')
        end
      end

      serialized
    end
  end

  mount UsersAPI
  mount BlogAPI
end
