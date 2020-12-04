class Api::V1::TodosController < ApiController

  skip_before_action :verify_authenticity_token

  def show
    @todo = Todo.find(params[:id])

    render json: @todo, status: :ok
  end

  def create
    @todo = Todo.new(todo_params_on_create)

     if @todo.project_id.nil?
       @project = Project.create(title: params[:title])
       @todo.project_id = @project.id
     end

     if @todo.save
       render json: @todo, status: :created
     else
       render json: @todo.errors, status: :unprocessable_entity
     end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params_on_update)
      render json: @todo, status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private
  def todo_params_on_create
    params.require(:todo).permit(:text, :isCompleted, :project_id, :title)
  end

  def todo_params_on_update
    params.require(:todo).permit(:isCompleted)
  end

end