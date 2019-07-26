# frozen_string_literal: true

# By Ryan Bates - http://railscasts.com/episodes/350-rest-api-versioning

class ApiConstraints
  attr_reader :default, :version

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    default || req.accept.include?("application/vnd.howlr.v#{version}+json")
  end
end
