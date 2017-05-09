class GithubUser

  attr_reader :name, :avatar_url, :followers_url, :following_url, :starred_url

  def initialize(attrs = {})
    @attrs = attrs
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

end
