@user = User.create!(email: "test1@test.com", 
	first_name: "joy", last_name: "wald", 
	password: "secret", password_confirmation: "secret",
	phone: "9082833403")
  
  puts "1 user created" 

  AdminUser.create!(email: "test@test.com", 
  	first_name: "pete", last_name: "wald", 
  	password: "secret", password_confirmation: "secret",
	phone: "9082833403")
  
  puts "1 admin created" 

100.times do |post|
	Post.create!(date: Date.today, 
		rationale: "#{post} Lorem ipsum dolor sit amet, 
		consectetur adipiscing elit, sed do eiusmod tempor 
			incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
			Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
			fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
			qui officia deserunt mollit anim id est laborum.", user_id:@user.id, 
		overtime_request: 2.5)
	
end

puts "100 posts have been created"


100.times do |audti_log|
	AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 3.days))
	
end

puts "100 audit logs have been created"
