class IndexController < ApplicationController
  layout 'proj'
  def index
    @featured_posts = Project.featured_posts.limit(12)
    @collaborators = Person.find_by_twitter_account("natematias").unique_collaborators
    @featured_projects = Project.featured_projects.limit(8)
  end
end
