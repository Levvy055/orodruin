namespace :test do
  desc 'Test Services'
  Rake::TestTask.new(:services) do |t|
    t.libs << 'test'
    t.pattern = 'test/services/**/*_test.rb'
  end

  desc 'Travis-CI task'
  task ci: %i(test konacha:run spinach)
end

Rake::Task['test'].enhance ['test:services']
