require 'rails_helper'

feature 'Feature: user updates review.' do
  context 'As an authenticated user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'succesfully update a review' do
      skip "Update functionality not implemented yet"
    end

    scenario 'cannot update a review I did not create' do
      skip "Update functionality not implemented yet"
    end
  end
end
