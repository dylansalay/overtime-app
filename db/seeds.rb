100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content")
end

puts "100 posts have been created"

1.times do |user|
  User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
end

puts "Jon Snow has been created"
