require 'active_resource'

REDMINE_SITE    = ENV["REDMINE_SITE"]
REDMINE_USER    = ENV["REDMINE_USER"]
REDMINE_PASS    = ENV["REDMINE_PASS"]
REDMINE_PROJECT = ENV["REDMINE_PROJECT"]

# Because for some reason Redmine/ActiveResource is imperfect
class RedmineCollection < ActiveResource::Collection

  def initialize(parsed = {})
    @elements = parsed.values.first
  end

end
