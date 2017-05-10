class GithubService

  # def initialize
  #   @_conn = Faraday.new('https://api.github.com')
  # end

  def self.get_user(access_token)
    response = Faraday.get("https://api.github.com/user?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_followers(access_token)
    response = Faraday.get("https://api.github.com/user/followers?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end


  def self.find_following(access_token)
    response = Faraday.get("https://api.github.com/user/following?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_starred_repos(access_token)
    response = Faraday.get("https://api.github.com/user/starred?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_repos(access_token)
    response = Faraday.get("https://api.github.com/user/repos?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end
  # private
  #   def conn
  #     @_conn
  #   end
end
