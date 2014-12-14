class UsersAPI < Grape::API
  namespace 'users'

  desc 'Get user info'
  params do
    requires :name, type: String, desc: 'User nickname'
  end
  get ':name' do
    user = User.find_by_nickname(params[:name])
    present user
  end
end
