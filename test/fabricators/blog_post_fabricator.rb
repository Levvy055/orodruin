Fabricator('Blog::Post') do
  text_raw { FFaker::Lorem.paragraphs(5).join('') }
  title { FFaker::Lorem.sentence }

  author fabricator: :user
end
