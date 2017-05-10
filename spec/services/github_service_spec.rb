require 'rails_helper'

describe GithubService do
  context '.get_user' do
    it 'returns a raw user' do
      access_token = ENV['github_oauth_token']
      githubuser = GithubService.get_user(access_token)

      expect(githubuser).to be_a(Hash)
      expect(githubuser).to have_key(:name)
      expect(githubuser).to have_key(:login)
      expect(githubuser).to have_key(:avatar_url)
      expect(githubuser).to have_key(:followers_url)
      expect(githubuser).to have_key(:following_url)
      expect(githubuser).to have_key(:starred_url)
      expect(githubuser[:name]).to be_a(String)
      expect(githubuser[:login]).to be_a(String)
      expect(githubuser[:avatar_url]).to be_a(String)
      expect(githubuser[:followers_url]).to be_a(String)
      expect(githubuser[:following_url]).to be_a(String)
      expect(githubuser[:starred_url]).to be_a(String)
    end
  end

  context '.find_followers' do
    it "returns followers" do
      access_token = ENV['github_oauth_token']
      github_user = GithubService.get_user(access_token)
      followers = GithubService.find_followers(access_token)
      follower = followers.first

      expect(followers).to be_an(Array)
      expect(followers.count).to eq(6)
      expect(follower).to be_a(Hash)

      expect(follower).to have_key(:login)
      expect(follower[:login]).to be_a(String)
    end
  end
end
