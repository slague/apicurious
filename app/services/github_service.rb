class GithubService

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

  def self.find_organizaitons(access_token)
    response = Faraday.get("https://api.github.com/user/orgs?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_events(login, access_token)
    response = Faraday.get("https://api.github.com/users/#{login}/events?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
