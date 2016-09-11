require 'rails_helper'

RSpec.feature "user creates an idea" do
  scenario "user account creates idea with name, description, and category" do
    account = Account.create(username: "Dan", password: "123")
    Category.create(name: "homework")
    visit '/'
    click_on "Log In"
    fill_in "Username", with: "Dan"
    fill_in "Password", with: "123"
    click_on "Login"
    visit ideas_path
    click_on "Create New Idea"
    fill_in "Name", with: "Idea 1"
    fill_in "Description", with: "Great Idea"
    select "homework", :from => "Category"
    click_on "Create Idea"
    expect(page).to have_content("Idea 1")
    expect(page).to have_content("Great Idea")
  end
end
