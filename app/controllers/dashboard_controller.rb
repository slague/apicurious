class DashboardController < ApplicationController

  def index
    @github_user = GithubUser.create_github_user(current_user.oauth_token)
  end

end
