class Event

  attr_reader :id, :type, :payload, :repo, :public, :created_at

  def initialize(attrs = {})
    @attrs = attrs
    @id = attrs[:id]
    @type = attrs[:type]
    @payload = attrs[:payload]
    @repo = attrs[:repo]
    @public = attrs[:public]
    @created_at = attrs[:created_at]
  end

  def date
    DateTime.parse(created_at).strftime('%b %d, %Y')
  end
end
