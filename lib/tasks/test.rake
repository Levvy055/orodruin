namespace :test do
  task ci: %i(test konacha:run spinach coveralls:push)
end
