require 'rails_helper'

describe 'Project validation', type: :model do
  it 'should require title' do
    project = Project.create()
    expect(project.valid?).to eq(false)
  end

  it 'should be able to save project' do
    project = Project.create(title: "Test_Project")
    expect(project.valid?).to eq(true)
  end

  it 'title length should be minimum 4' do
    project = Project.create(title: "Gnu")
    expect(project.valid?).to eq(false)
  end

  context 'title should be uniqueness' do
    before do
      project = Project.create(title: "Test")
    end
    it 'is invalid if title is not uniq' do
      project = Project.create(title: "Test")
      expect(project.valid?).to eq(false)
    end

    it 'is valid if title is uniq' do
    project = Project.create(title: "Test1")
    expect(project.valid?).to eq(true)
    end
  end
end
