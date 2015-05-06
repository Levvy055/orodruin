class API < Grape::API
  version 'v1.0', using: :header, vendor: 'orodruin'

  default_format :json
  format :json

  mount UsersAPI
  mount BlogAPI
end
