class WorksController < ApplicationController
  def show
    @work = Work.find_by!(slug: params[:slug])
    @previous_work = Work.where("id < ?", @work.id).order(id: :desc).first
    @next_work = Work.where("id > ?", @work.id).order(id: :asc).first
  end
end
