require 'rails_helper'

describe "A user sees her github profile info after logging in" do
  scenario "when they log in with github", vcr: true do

    # access_token = ENV['github_oauth_token']
    # githubuser = GithubUser.create_github_user(access_token)

    Capybara.app = Apicurious::Application
    stub_omniauth

    visit root_path
    # expect status code 200....
    expect(page).to have_link("Sign in with Github")

    click_link('Sign in with Github')

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_link("Logout")
    expect(page).to have_content("slague")
    expect(page).to have_content("Stephanie Bentley")
    expect(page).to have_css("img[src='https://avatars3.githubusercontent.com/u/21252193?v=3']")
    expect(page).to have_content("Followers")
    expect(page).to have_content("Following")
    expect(page).to have_content("Stars")
    expect(page).to have_content("Organizations")
  end
end
