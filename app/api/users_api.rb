class UsersAPI < Grape::API
  prefix 'users'

  get '/' do
    present User.all
  end

  get '/:nickname' do
    present User.find_by_nickname(params[:nickname])
  end
end
