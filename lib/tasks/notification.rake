namespace :notification do

  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
  	# 1. Schedule to run at Sunday 5pm
  	# 2. Iterate over all employees
  	# 3. Skip AdminUsers
  	# 4. Send a meesage that has instructions and a link to log time
  	#end
   # User.all.each do |user|
  #  	SmsTool.send_sms()
   # end
  end



 desc "Send mail notification to manager of pending overtime requests"
  task manager_email: :environment do
   # 1. iterate over list of pending overtime requests
   # 2. Check if there are any requests
   # 3. Iterate over list of admin user
   # 4. send email to each admin
   submitted_posts = Post.submitted
    admin_users = AdminUsers.all

   if submitted_posts.count > 0 
     admin_users.each do |admin|
      ManagerMailer.email(admin).deliver_later
     end
   end 
  end
end