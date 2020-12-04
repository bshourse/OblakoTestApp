require 'rails_helper'

describe 'Todo validation', type: :model do
  it 'should require text' do
    todo = Todo.create(text:"", isCompleted: false, project_id: 1)
    expect(todo.valid?).to eq(false)
  end

  it 'should be able to save task' do
    todo = Todo.create(text:"Test", isCompleted: true, project_id: 1)
    expect(todo.valid?).to eq(true)
  end

  it 'text length should be minimum 4' do
    todo = Todo.create(text: "TTT", isCompleted: true, project_id: 1)
    expect(todo.valid?).to eq(false)
  end

  it 'isCompleted must be boolean' do
    todo = Todo.create(text: "Test", isCompleted: "", project_id: 1)
    expect(todo.valid?).to eq(false)
  end
end
