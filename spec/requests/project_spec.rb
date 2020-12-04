require 'rails_helper'

describe 'Projects API', type: :request do
  describe 'GET Projects' do
    before do
      FactoryBot.create(:project, title: "Test Project")
      FactoryBot.create(:project, title: "Test Project2")
    end

    it 'should return all projects' do

      get '/api/v1/projects'

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json.size).to eq(2)
    end
  end
end