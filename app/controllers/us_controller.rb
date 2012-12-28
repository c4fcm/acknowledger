class UsController < ApplicationController
  layout "proj"
  def index
    natematias = Person.find_by_twitter_account("natematias")    
    @project_people = natematias.unique_collaborators
    puts @project_people
  end
end
