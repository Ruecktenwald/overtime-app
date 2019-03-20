require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'navigate' do
    before do
        @user = FactoryGirl.create(:user)
        login_as(@user, :scope => :user)
    end

    feature 'index' do
      before do
        visit posts_path
      end

      it 'can be reached successfully' do 
      
        expect(page.status_code).to eq(200)
      end
    
      it 'has a title of Posts' do
        expect(page).to have_content(/Posts/)
      end
      it 'has a list of posts' do
        post1 = FactoryGirl.create(:post)
        post2 = FactoryGirl.create(:second_post)

        visit posts_path
        
        expect(page).to have_content 'Some rationale'
        expect(page).to have_content 'More rationale'
      end
    end
    feature 'new' do
      it 'has a link to new from homepage' do
        visit root_path
        click_link("new_post_from_nav")

        expect(page).to have_content("New Post")
      end


    end

    feature 'creation' do
      before do
        visit new_post_path
      end

      it 'has a new form that can be reached' do
        
        expect(page.status_code).to eq(200)
      end

      it 'can be created from new form page' do
        

        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Some Rationale"
        
        click_on "Save"

        expect(page).to have_content("Some Rationale")

      end

      it 'will have a user associated with it' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "User_Association"
        
        click_on "Save"

        expect(User.last.posts.last.rationale).to eq("User_Association")
      end
    end

    feature 'edit' do
      before do
        @post = FactoryGirl.create(:post)
      end
      it 'can be reached by clicking edit on index page' do
      
        visit posts_path
        click_link("edit_#{@post.id}")

        expect(page).to have_content(/Edit Post/)
      end

      it 'can be edited' do
        visit edit_post_path(@post)

        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Edited content"
        
        click_on "Save"

        expect(page).to have_content("Edited content")

      end


    end

  end
end
