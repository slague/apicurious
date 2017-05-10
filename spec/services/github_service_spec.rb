require 'rails_helper'

describe GithubService do
  attr_reader :access_token
  before do
    @access_token = ENV['github_oauth_token']
  end
  context '.get_user', vcr: true do
    it 'returns a raw user' do
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

  context '.find_followers', vcr: true do
    it "returns followers" do
      followers = GithubService.find_followers(access_token)
      follower = followers.first

      expect(followers).to be_an(Array)
      expect(follower).to be_a(Hash)

      expect(follower).to have_key(:login)
      expect(follower[:login]).to be_a(String)
    end
  end
  context '.find_following', vcr: true do
    it 'returns those being followed' do
      following = GithubService.find_following(access_token)
      first_followed = following.first

      expect(following).to be_an(Array)
      expect(first_followed).to be_a(Hash)

      expect(first_followed).to have_key(:login)
      expect(first_followed[:login]).to be_a(String)
    end
  end
  context '.find_starred_repos', vcr: true do
    it 'finds and counts the number of starred repos' do
      starred_repos = GithubService.find_starred_repos(access_token)
      first_repo = starred_repos.first

      expect(starred_repos).to be_an(Array)
      expect(first_repo).to be_a(Hash)

      expect(first_repo).to have_key(:name)
      expect(first_repo[:name]).to be_a(String)
      expect(first_repo[:name]).to eq("apicurious")
    end
  end
  context '.find_repos', vcr: true do
    it 'returns a collection of repos' do
      repos = GithubService.find_repos(access_token)
      repo = repos.first

      expect(repos).to be_an(Array)
      expect(repo).to be_a(Hash)

      expect(repo).to have_key(:name)
      expect(repo[:name]).to be_a(String)
    end
  end
  context '.find_repos', vcr: true do
    it 'returns a collection of organizations' do
      orgs = GithubService.find_organizaitons(access_token)
      org = orgs.first

      expect(orgs).to be_an(Array)
      # expect(org).to be_a(Hash)
    end
  end
  context '.find_events', vcr: true do
    it 'returns a collection of events' do
      github_user = GithubUser.create_github_user(access_token)
      events = GithubService.find_events(github_user.login)
      event = events.first

      expect(events).to be_an(Array)
      expect(event).to be_a(Hash)

      expect(event).to have_key(:type)
      expect(event[:type]).to be_a(String)
      expect(event).to have_key(:repo)
      expect(event[:repo]).to be_a(Hash)
    end

  end
end
