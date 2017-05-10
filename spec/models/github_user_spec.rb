require 'rails_helper'

describe GithubUser do
  context '.create_github_user(access_token)' do
    it 'it builds a github_user with basic profile info' do
    access_token = ENV['github_oauth_token']
    githubuser = GithubUser.create_github_user(access_token)

      expect(githubuser.name).to eq("Stephanie Bentley")
      expect(githubuser.login).to eq("slague")
      expect(githubuser.avatar_url).to eq("https://avatars3.githubusercontent.com/u/21252193?v=3")
      expect(githubuser.followers_url).to eq("https://api.github.com/users/slague/followers")
      expect(githubuser.following_url).to eq("https://api.github.com/users/slague/following{/other_user}")
      expect(githubuser.starred_url).to eq("https://api.github.com/users/slague/starred{/owner}{/repo}")
    end
  end
  context '#followers' do
    it 'returns a collection of followers' do
      access_token = ENV['github_oauth_token']
      github_user = GithubUser.create_github_user(access_token)
      followers = github_user.followers(access_token)
      robo = followers.first

      expect(followers).to be_an(Array)
      expect(robo.login).to eq("ideashower")
    end
  end
  context '#following' do
    it 'returns a collection of github_users being followed' do
      access_token = ENV['github_oauth_token']
      github_user = GithubUser.create_github_user(access_token)
      following = github_user.following(access_token)
      person = following.first

      expect(following).to be_an(Array)
      expect(person.login).to eq("larquin")
    end
  end
  context '#number_of_starred_repos' do
    it 'counts the number of repos that have been starred' do
      access_token = ENV['github_oauth_token']
      github_user = GithubUser.create_github_user(access_token)
      count = github_user.number_of_starred_repos(access_token)

      expect(count).to be_a(Fixnum)
      expect(count).to eq(1)
    end
  end
end
