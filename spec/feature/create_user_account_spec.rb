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
    expect(page).to have_content("Dan")
    expect(page).to have_content("Logout")
    expect(page).to have_link "New Idea", new_idea_path
    # then I see a button to create my first idea
  end

  scenario "visitor logs into user account" do
    account = Account.create(username: "Dan", password: "123")

    visit '/'
    click_on "Log In"
    fill_in "Username", with: "Dan"
    fill_in "Password", with: "123"
    click_on "Login"
    expect(page).to have_content("Dan")
    expect(page).to have_content("Logout")
    expect(page).to have_link "New Idea", new_idea_path
  end

  scenario "visitor logs out of user account" do
    account = Account.create(username: "Dan", password: "123")

    visit '/'
    click_on "Log In"
    fill_in "Username", with: "Dan"
    fill_in "Password", with: "123"
    click_on "Login"
    expect(page).to have_content("Dan")
    expect(page).to have_content("Logout")
    click_on "Logout"
    expect(page).to_not have_content("Dan")
    expect(page).to have_content("Login")
  end
end
