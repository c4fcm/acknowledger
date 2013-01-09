class ProjController < ApplicationController
  layout "proj"
  def view
    @project = Project.find(params[:id])
    redirect_to @project.uri if(!@project.category.index("post").nil?)
  end
end
