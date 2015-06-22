require 'fabrication'

Fabricate(:user, email: 'test@example.com', password: '12345qwert')

10.times { Fabricate('Blog::Post') }
