require 'rails_helper'

describe 'Homepage' do
  it 'allows the admin to approve posts from the hompage' do
  	post = FactoryGirl.create(:post)
  	admin_user = FactoryGirl.create(:admin_user)
  	login_as(admin_user, :scope => :user)

  	visit root_path
  	click_on 'Approve'

  	expect(post.reload.status).to eq("approved")
  end

  it 'allows the employee to change the audit log status from homepage' do
  	audit_log = FactoryGirl.create(:audit_log)
  	user = FactoryGirl.create(:user)
  	login_as(user, :scope => :user)


  	audit_log.update(user_id: user.id)
  	visit root_path

  	click_on("confirm_#{audit_log.id}")

  	expect(audit_log.reload.status).to eq("confirmed")

  end

end