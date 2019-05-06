require 'rails_helper'

describe 'navigate' do 
	before do
   @admin_user = FactoryGirl.create(:admin_user)
   login_as(@admin_user, :scope => :user)
 end

 describe 'edit' do
   before do 
     @post = FactoryGirl.create(:post)
   end

   it 'has a staus that can be edited on the form' do
    visit edit_post_path(@post)

    choose('post_status_approved')
    click_on "Save"

    expect(@post.reload.status).to eq("approved") 
  end

  it 'should not be editable by post creator if status is approved' do
    logout(:user)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    @post.update(user_id: user.id, status: 'approved')
    visit edit_post_path(@post)
    expect(current_path).to eq(root_path)
  end





end
end