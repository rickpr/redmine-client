require 'active_resource'

class Issue < ActiveResource::Base
  self.site     = REDMINE_SITE
  self.user     = REDMINE_USER
  self.password = REDMINE_PASS
  self.collection_parser = RedmineCollection
  self.include_root_in_json = true
end
