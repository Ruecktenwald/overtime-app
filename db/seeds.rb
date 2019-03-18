100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale")
	
end

puts "100 posts have been created"

User.create!(email: "test@test.com", first_name: "pete", last_name: "wald", password: "secret", password_confirmation: "secret")