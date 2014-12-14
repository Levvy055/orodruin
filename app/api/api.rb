class API < Grape::API
  version 'v1.0', using: :header, vendor: 'orodruin'

  before do
    header 'Access-Control-Allow-Origin', '*'
    header 'Access-Control-Request-Method', '*'
    header 'Access-Control-Allow-Headers', 'content-type, accept'
  end

  default_format :json
  format :json

  mount UsersAPI

  add_swagger_documentation(mount_path: '/documentation',
                            base_path: '/api',
                            hide_format: true,
                            hide_documentation_path: true)
end
