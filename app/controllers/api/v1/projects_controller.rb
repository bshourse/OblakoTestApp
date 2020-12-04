class Api::V1::ProjectsController < ApiController

  def index
    render json: Project.all, status: :ok
  end

  def show
    @project = Project.find(params[:id])

    render json: @project, status: :ok
  end

end
