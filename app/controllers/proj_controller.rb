class ProjController < ApplicationController
  def view
    @project = Project.find(params[:id])
  end
end
