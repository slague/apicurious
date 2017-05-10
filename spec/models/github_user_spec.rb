require 'rails_helper'

describe GithubUser do

  attr_reader :access_token, :stubbed_user
  before do
    @access_token = ENV['github_oauth_token']
    @stubbed_user = {login: "slague", followers_url: "https://api.github.com/users/slague/followers",
                        following_url: "https://api.github.com/users/slague/following{/other_user}",
                        starred_url: "https://api.github.com/users/slague/starred{/owner}{/repo}",
                        organizations_url: "https://api.github.com/users/slague/orgs",
                        repos_url: "https://api.github.com/users/slague/repos",
                        name: "Stephanie Bentley"}
  end

  context '.create_github_user(access_token)', vcr: true do
    it 'it builds a github_user with basic profile info' do
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
      stubbed_followers = [{login: "ideashower"}, {login: "larquin"}]
      allow(GithubService).to receive(:get_user).with(access_token).and_return(stubbed_user)
      allow(GithubService).to receive(:find_followers).with(access_token).and_return(stubbed_followers)
      github_user = GithubUser.create_github_user(access_token)
      followers = github_user.followers(access_token)
      robo = followers.first

      expect(followers).to be_an(Array)
      expect(robo.login).to eq("ideashower")
    end
  end
  context '#following' do
    it 'returns a collection of github_users being followed' do
      stubbed_following = [{login: "larquin"},{login: "ideashower"}]
      allow(GithubService).to receive(:get_user).with(access_token).and_return(stubbed_user)
      allow(GithubService).to receive(:find_following).with(access_token).and_return(stubbed_following)
      github_user = GithubUser.create_github_user(access_token)
      following = github_user.following(access_token)
      person = following.first

      expect(following).to be_an(Array)
      expect(person.login).to eq("larquin")
    end
  end
  context '#number_of_starred_repos' do
    it 'counts the number of repos that have been starred' do
      stubbed_starred_repos = [{name: "apicurious"}]
      allow(GithubService).to receive(:get_user).with(access_token).and_return(stubbed_user)
      allow(GithubService).to receive(:find_starred_repos).with(access_token).and_return(stubbed_starred_repos)
      github_user = GithubUser.create_github_user(access_token)
      count = github_user.number_of_starred_repos(access_token)

      expect(count).to be_a(Fixnum)
      expect(count).to eq(1)
    end
  end
  context '#repos' do
    it 'returns a collection of repos for a github_user' do
      stubbed_repos = [{name: "wellness_tracker"}, {name: "rails_engine"}]
      allow(GithubService).to receive(:get_user).with(access_token).and_return(stubbed_user)
      allow(GithubService).to receive(:find_repos).with(access_token).and_return(stubbed_repos)
      github_user = GithubUser.create_github_user(access_token)
      repos = github_user.repos(access_token)
      repo = repos.first

      expect(repos).to be_an(Array)
      expect(repo.name).to eq("wellness_tracker")
    end
  end
end
