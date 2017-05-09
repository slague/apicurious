require 'rails_helper'

describe GithubUser do
  context 'it finds a github user' do
    it 'it returns basic information for a user' do
    # access_token = ENV['github_oauth_token']
    # githubuser = GithubUser.new(github_oauth_token)

      expect(githubuser.name).to eq("Stephanie Bentley")
      expect(githubuser.avatar_url).to eq("https://avatars3.githubusercontent.com/u/21252193?v=3")
      expect(githubuser.followers_url).to eq("https://api.github.com/users/slague/followers")
      expect(githubuser.following_url).to eq("https://api.github.com/users/slague/followers")
      expect(githubuser.starred_url).to eq("https://api.github.com/users/slague/starred{/owner}{/repo}")
    end
  end
end
