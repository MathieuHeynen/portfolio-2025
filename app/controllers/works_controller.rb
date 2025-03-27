class WorksController < ApplicationController
  def show
    @work = Work.find_by!(slug: params[:slug])
  end
end
