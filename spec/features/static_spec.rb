require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'visiting a page and looking for navbar items for logged in and non logged in users' do
    it 'for logged in user page has ability to look up past searches' do
      @user = FactoryBot.create(:user)

      login_as(@user, :scope => :user)

      visit root_path

      expect(page).to have_link('Look-up Past Searches')
    end

    it 'for user not logged in page does not display option to look up past searches' do
      visit root_path

      expect(page).to have_no_link('Look-up Past Searches')
    end
  end
end