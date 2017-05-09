require 'rails_helper'

describe GithubUser do
  context '.create_github_user(access_token)' do
    it 'it builds a github_user with basic profile info' do
    access_token = ENV['github_oauth_token']
    githubuser = GithubUser.create_github_user(access_token)

      expect(githubuser.name).to eq("Stephanie Bentley")
      expect(githubuser.avatar_url).to eq("https://avatars3.githubusercontent.com/u/21252193?v=3")
      expect(githubuser.followers_url).to eq("https://api.github.com/users/slague/followers")
      expect(githubuser.following_url).to eq("https://api.github.com/users/slague/following{/other_user}")
      expect(githubuser.starred_url).to eq("https://api.github.com/users/slague/starred{/owner}{/repo}")
    end
  end
end
