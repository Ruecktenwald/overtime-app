require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'navigate' do
    
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
    end
  end
end
