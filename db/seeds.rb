@user = User.create!(email: "test1@test.com", first_name: "joy", last_name: "wald", password: "secret", password_confirmation: "secret")
  
  puts "1 user created" 

  AdminUser.create!(email: "test@test.com", first_name: "pete", last_name: "wald", password: "secret", password_confirmation: "secret")
  
  puts "1 admin created" 

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale", user_id:@user.id)
	
end

puts "100 posts have been created"

