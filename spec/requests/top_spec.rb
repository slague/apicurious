require 'rails_helper'

describe "access top page" do
  it "can sign in user with Github account" do
    visit root_path
    page.should have_content("Sign in with Github")
    mock_auth_hash
    click_link "Sign in"
    page.should have_content("mockuser")  # user name
    # page.should have_css('img', :src => 'mock_user_thumbnail_url') # user image
    page.should have_content("Log out")
  end

  it "can handle authentication error" do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit '/'
    page.should have_content("Sign in with Github")
    click_link "Log in"
    page.should have_content('Authentication failed.')
  end

end


require 'rails_helper'

# RSpec.feature 'User can log in with Slack' do
#   context 'An existing user has valid credentials' do
#
#     before do
#       Capybara.app = Poodr::Application
#       stub_oauth
#     end
#
#     def stub_oauth
#       OmniAuth.config.test_mode = true
#
#       OmniAuth.config.mock_auth[:slack] = OmniAuth::AuthHash.new({
#                                            provider: 'slack',
#                                            uid: '1234',
#                                            info: {
#                                             user: 'POODR'
#                                            },
#                                            credentials: {
#                                              token: 'lasagna'
#                                            }
#       })
#     end
#
#     scenario 'The user clicks login on root path' do
#       visit '/'
#
#       expect(page.status_code).to eq 200
#
#       click_link 'slack-login-btn'
#
#       expect(current_path).to eq user_path(User.last)
#
#       expect(page.body).to have_content 'Welcome, POODR!'
#       expect(page.body).to have_link 'Logout'
#     end
#   end
# end
