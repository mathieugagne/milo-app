class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    redirect_to search_projects_path
  end

  def search
    @search = Project.search do
      fulltext params[:q]
      facet :status
      with(:status, params[:status]) if params[:status].present?
      order_by params[:sort] || :title, params[:direction] || :asc
      paginate page: params[:page], per_page: 10
    end
    @projects = @search.results
  end

  # GET /projects/1
  def show
    @comments = @project.comments.order(created_at: :desc)
    @comment = @project.comments.build
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def project_params
    params.require(:project).permit(:title, :description, :status, {user_ids: []})
  end

  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : :title
  end
  helper_method :sort_column

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction].to_sym : :asc
  end
  helper_method :sort_direction
end
