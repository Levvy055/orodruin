# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

begin
  ActiveRecord::Base.transaction do
    require Rails.root.join('db', 'seeds', Rails.env)
  end
rescue LoadError
  $stderr.puts "No seeds for #{Rails.env} environment"
end
