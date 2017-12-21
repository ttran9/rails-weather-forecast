require 'rails_helper'

describe 'forecast controller test.' do

  describe 'by viewing the search page' do
    before do
      visit root_path
    end

    it 'by visiting the search forecast page' do
      expect(current_path).to eq(root_path)
    end

    it 'by entering an address with the search' do
      fill_in 'search[address]', with: '1600 Amphitheatre Parkway'

      click_on "Search"

      chart = page.find_by_id('chart-1')

      expect(chart.class).to eq(Capybara::Node::Element)
    end

    it 'by not entering in an address the user is redirected' do
      fill_in 'search[address]', with: ''

      click_on "Search"

      expect(current_path).to eq(root_path)
    end
  end

  describe 'previous search(es)' do

    before do
      @user = FactoryBot.create(:user)
      login_as(@user, :scope=>:user)
    end

    it 'user can view this page' do
      visit forecasts_user_searches_path

      expect(page.status_code).to eq(200)
    end

    it 'user is not logged in and cannot see this page' do
      logout(:user)
      visit forecasts_user_searches_path

      expect(current_path).to eq(new_user_session_path)
    end

    it 'user has not made any searches and can view the page but will not see any search results' do
      visit forecasts_user_searches_path

      expect(page).to have_content("You have not made any searches")
    end

    it 'user has made at least one search and can view specified text' do
      @search = Search.create!(address: "1 Hacker Way", user_id: @user.id)

      visit forecasts_user_searches_path

      expect(page).to have_content("Your search history below:")
    end
  end
end