class GithubUser

  attr_reader :name, :login, :avatar_url, :followers_url, :following_url, :starred_url

  def initialize(attrs = {})
    @attrs = attrs
    @login = attrs[:login]
    @name = attrs[:name]
    @avatar_url = attrs[:avatar_url]
    @followers_url = attrs[:followers_url]
    @following_url = attrs[:following_url]
    @starred_url = attrs[:starred_url]
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

  def number_of_starred_repos(access_token)
    count = GithubService.find_starred_repos(access_token).count
    count
  end
end
