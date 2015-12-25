require 'rails_helper'

feature 'Feature: user creates review.' do
  context 'As an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'create a new review' do
      visit new_review_path
      select 'Bangkok', from: 'review_city_id'
      fill_in 'Description', with: 'Bagan is magical'
      fill_in 'Value', with: 8
      fill_in 'Beauty', with: 8
      fill_in 'Activities', with: 8
      fill_in 'Friendliness', with: 8
      fill_in 'Food', with: 8
      fill_in 'Touristy', with: 8
      click_button 'Create Review'

      expect(page).to have_content('Review created! Write another one?')
    end

    scenario 'fail to create a review due to invalid input' do
      visit new_review_path
      select 'Bangkok', from: 'review_city_id'
      fill_in 'Description', with: 'Bagan is magical'
      fill_in 'Value', with: 8
      fill_in 'Beauty', with: 8
      fill_in 'Activities', with: 8
      fill_in 'Friendliness', with: 8
      fill_in 'Food', with: 8
      # in case it's opaque: I'm leaving out the 'Touristy' field

      click_button 'Create Review'
      expect(page).to have_content("Please fill in all fields")
    end

    scenario 'fail to create a duplicate review' do
      skip "Users shouldn't be able to create multiple reviews for one city, they currently can"
    end
  end
end
