class ProjectsController < ApplicationController
  layout 'dashboard/main'
  before_action :set_project, only: [:show, :edit, :update, :destroy, :sync_issues]

  # GET /projects
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  def show
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

  def sync_issues
    @project.sync_issues
      redirect_to @project, notice: 'Project was successfully synced.'

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
      params.require(:project).permit(:name, :slug, :user, :trello_board_uid, :created_at, :updated_at).merge(user_id: current_user.id)
    end
end
