class Repo

  attr_reader :name, :full_name, :owner, :html_url

  def initialize(attrs = {})
    @attrs = attrs
    @name = attrs[:name]
    @full_name = attrs[:full_name]
    @owner = attrs[:owner]
    @html_url = attrs[:html_url]
  end

end
