class UsController < ApplicationController
  layout "proj"
  def index
    natematias = Person.find_by_twitter_account("natematias")    
    @project_people = natematias.unique_collaborators
    puts @project_people
  end

  def person
    @person = Person.find(params[:id])
    render :layout=>"person"
  end
end
