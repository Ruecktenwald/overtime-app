require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'navigate' do
    
    feature 'index' do
      
      it 'can be reached successfully' do 
        visit posts_path

        expect(page.status_code).to eq(200)
      end
      
      it 'has a title of Posts' do
        visit posts_path

        expect(page).to have_content(/Posts/)
      end
    end


    feature 'creation' do
      it 'has a new form that can be reached' do
        visit new_post_path
        expect(page.status_code).to eq(200)
      end

      it 'can be created from new form page' do
        visit new_post_path

        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Some Rationale"
        
        click_on "Save"

        expect(page).to have_content("Some Rationale")
      end
    end
  end
end
