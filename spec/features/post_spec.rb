require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'navigate' do
    
    feature 'index' do
      before do
        user = User.create(email: "test@test.com", first_name: "pete", last_name: "wald", password: "secret", password_confirmation: "secret")
        login_as(user, :scope => :user)
      visit posts_path
      end
        it 'can be reached successfully' do 
        
          expect(page.status_code).to eq(200)
        end
      
        it 'has a title of Posts' do
        

          expect(page).to have_content(/Posts/)
        end
    end


    feature 'creation' do
      before do
        user = User.create(email: "test@test.com", first_name: "pete", last_name: "wald", password: "secret", password_confirmation: "secret")
        login_as(user, :scope => :user)
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
  end
end
