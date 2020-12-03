class Api::V1::ProjectsController < ApiController

  def index
    render json: Project.all, status: :ok
  end

end
