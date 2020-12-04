require 'rails_helper'

describe 'Todo API', type: :request do
  describe 'POST Todo' do

    it 'create a new task' do
      expect {
        post '/api/v1/todos', params: { todo: {text: 'Task1', isCompleted: false, project_id: 1}}
      }.to change { Todo.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end

    it 'task should not create because of the missing parametr' do

      post '/api/v1/todos', params: { todo: {text: 'Task1'}}

      expect(response).to have_http_status(:unprocessable_entity)
    end

  describe 'PATCH /projects/:id/todos/:id' do
    let!(:project) { FactoryBot.create(:project, title: "Test Project") }
    let!(:todo) { FactoryBot.create(:todo, text: "Task", isCompleted: false, project_id: 1)}

      it 'should update the value of attribute: isCompleted' do
      patch "/api/v1/projects/#{project.id}/todos/#{todo.id}", params: { todo: {isCompleted: true}}

      expect(response).to have_http_status(:ok)
      end
    end
  end
end
