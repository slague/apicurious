class GithubUser


  def initialize(attrs = {})
    @attrs = attrs
    @name = attrs[:name]
    @avatar_url = attrs[:avatar_url]
    @followers_url = attrs[:followers_url]
    @following_url = attrs[:following_url]
    @starred_url = attrs[:starred_url]
  end

  # def self.find_all_by(filter = {})
  # SunlightService.legislators_by(filter).map do |raw_legislator|
  #   new(raw_legislator)
  # end

   def new_user(access_token)
     GithubService.get_user(access_token).map do |raw_user|
       new(raw_user)
   end
end

end



# it 'it returns basic information for a user' do
#   token = '41114ffaab211c22633528a1cfaaef29cd6c2041'
#   githubuser = GithubUser.new(token)
#
#   expect(githubuser.name).to eq("Stephanie Bentley")
#   expect(githubuser.avatar_url).to eq("https://avatars3.githubusercontent.com/u/21252193?v=3")
#   expect(githubuser.followers_url).to eq("https://api.github.com/users/slague/followers")
#   expect(githubuser.following_url).to eq("https://api.github.com/users/slague/followers")
#   expect(githubuser.starred_url).to eq("https://api.github.com/users/slague/starred{/owner}{/repo}")
