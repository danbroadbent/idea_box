require 'rails_helper'

RSpec.feature "create user account" do
  scenario "visitor creates user account" do
    visit '/'
    # when i visit the homepage
    click_on "Sign Up"
    # and I click sign up
    expect(page).to have_content("Create New Account")
    fill_in "Username", with: "Dan"
    fill_in "Password", with: "123"
    # and I fill in a username and password
    click_on "Create Account"
    # and I click create account
    expect(page).to have_content("My Ideas")
    expect(page).to have_link "New Idea", new_idea_path
    # then I see a button to create my first idea
  end
end
