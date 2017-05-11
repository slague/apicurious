class Repo

  attr_reader :name, :full_name, :owner, :url

  def initialize(attrs = {})
    @attrs = attrs
    @name = attrs[:name]
    @full_name = attrs[:full_name]
    @owner = attrs[:owner]
    @url = attrs[:html_url]
  end

end
