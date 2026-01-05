class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  private

  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] &&
      password == ENV['ADMIN_PASSWORD']
    end
  end
end

# app/controllers/admin/works_controller.rb
class Admin::WorksController < Admin::BaseController
  before_action :set_work, only: [:show, :edit, :update, :destroy,
                                   :move_up, :move_down, :toggle_featured]

  def index
    @works = Work.order(position: :asc)
    @stats = {
      total: Work.count,
      featured: Work.featured.count,
      views: Work.sum(:views_count),
      categories: Work.group(:category).count
    }
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to admin_works_path, notice: 'Projet créé avec succès'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to admin_works_path, notice: 'Projet mis à jour'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @work.destroy!
    redirect_to admin_works_path, notice: 'Projet supprimé'
  end

  def move_up
    @work.move_higher
    redirect_to admin_works_path
  end

  def move_down
    @work.move_lower
    redirect_to admin_works_path
  end

  def toggle_featured
    @work.update(featured: !@work.featured)
    redirect_to admin_works_path
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(
      :title, :client, :description, :number, :slug,
      :category, :status, :featured, :github_url, :live_url,
      :start_date, :end_date, :meta_description,
      technologies: [], keywords: [], images: []
    )
  end
end
