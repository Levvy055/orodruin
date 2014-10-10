# vi: ft=ruby

require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.use_merging true
SimpleCov.start 'rails' do
  add_filter '/test/'
  add_filter '/features/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/vendor/'

  # Groups
  add_group 'Controllers',  'app/controllers'
  add_group 'API',          'app/api'
  add_group 'Models',       'app/models'
  add_group 'Decorators',   'app/decorators'
  add_group 'Helpers',      'app/helpers'
  add_group 'Mailers',      'app/mailers'
  add_group 'Uploaders',    'app/uploaders'
  add_group 'Jobs',         'app/jobs'
  add_group 'Services',     'app/services'
end
