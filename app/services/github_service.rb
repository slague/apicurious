class GithubService

  # def initialize
  #   @_conn = Faraday.new('https://api.github.com')
  # end

  def self.get_user(access_token)
    response = Faraday.get("https://api.github.com/user?access_token=#{access_token}")
    JSON.parse(response.body, symbolize_names: true)
  end


  # private
  #   def conn
  #     @_conn
  #   end
end
