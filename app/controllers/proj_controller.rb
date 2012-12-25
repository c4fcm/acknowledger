class ProjController < ApplicationController
  layout "proj"
  def view
    @project = Project.find(params[:id])
  end
end
