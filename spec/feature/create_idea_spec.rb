require 'rails_helper'

RSpec.feature "user creates an idea" do
  scenario "user account creates idea with name, description" do
    account = Account.create(username: "Dan", password: "123")
    Category.create(name: "homework")
    Image.create(name: "money", url: "https://pix-media.s3.amazonaws.com/blog/778/75135-Breaking-Bad-money-bed-Huell-5-pJrx.jpeg")
    visit '/'
    click_on "Log In"
    fill_in "Username", with: "Dan"
    fill_in "Password", with: "123"
    click_on "Login"
    # Idea.create(name: "Idea 1", description: "Great Idea", category_id: 1)
    visit ideas_path
    click_on "Create New Idea"
    fill_in "Name", with: "Idea 1"
    fill_in "Description", with: "Great Idea"
    fill_in "Category Id", with: 1
    click_on "Create Idea"
    expect(page).to have_content("Idea 1")
    expect(page).to have_content("Great Idea")
    expect(page).to have_content("homework")
  end
  scenario "user account creates idea with name, description, category, and image" do
    # account = Account.create(username: "Dan", password: "123")
    # Category.create(name: "homework")
    # Image.create(name: "money", url: "https://pix-media.s3.amazonaws.com/blog/778/75135-Breaking-Bad-money-bed-Huell-5-pJrx.jpeg")
    # visit '/'
    # click_on "Log In"
    # fill_in "Username", with: "Dan"
    # fill_in "Password", with: "123"
    # click_on "Login"
    # visit ideas_path
    # click_on "Create New Idea"
    # fill_in "Name", with: "Idea 1"
    # fill_in "Description", with: "Great Idea"
    # select "homework", :from => "Category"
    # select "money", :from => "Images"
    # click_on "Create Idea"
    # save_and_open_page
    # expect(page).to have_content("Idea 1")
    # expect(page).to have_content("Great Idea")
    # expect(page).to have_css("img")
  end
end
