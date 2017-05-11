class GithubUser

  attr_reader :name, :login, :avatar_url, :followers_url, :following_url, :starred_url, :organizations_url, :events_url

  def initialize(attrs = {})
    @attrs = attrs
    @login = attrs[:login]
    @name = attrs[:name]
    @avatar_url = attrs[:avatar_url]
    @followers_url = attrs[:followers_url]
    @following_url = attrs[:following_url]
    @starred_url = attrs[:starred_url]
    @organizations_url = attrs[:organizations_url]
    @events_url = attrs[:events_url]
  end

  def self.create_github_user(access_token)
    raw_user = GithubService.get_user(access_token)
    new(raw_user)
  end

  def followers(access_token)
    GithubService.find_followers(access_token).map do |raw_follower|
      GithubUser.new(raw_follower)
    end
  end

  def following(access_token)
    GithubService.find_following(access_token).map do |raw_followed|
      GithubUser.new(raw_followed)
    end
  end

  def starred_repos(access_token)
    GithubService.find_starred_repos(access_token).map do |raw_repo|
      Repo.new(raw_repo)
    end
  end

  def repos(access_token)
    GithubService.find_repos(access_token).map do |raw_repo|
    Repo.new(raw_repo)
    end
  end

  def organizations(access_token)
    GithubService.find_organizaitons(access_token).map do |raw_org|
      Organization.new(raw_org)
    end
  end

  def events(access_token)
    GithubService.find_events(login, access_token).map do |raw_event|
      Event.new(raw_event)
    end
  end

  def commits(access_token)
      push_events = []
      events(access_token).each do |event|
         push_events << event if event.type == "PushEvent"
      end
      payload_array = push_events.map do |event|
        event.payload
      end
      payload_array.map { |each_hash| each_hash[:commits].first[:message] }
  end

end
