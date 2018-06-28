require 'rails_helper'

RSpec.describe "Teams", type: :request do

  describe "GET" do
    it "index - 200 OK" do
      get "/v1/teams"
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        code: (be_kind_of String),
        ])
      expect(response).to have_http_status(200)
    end
    it 'show - 200 OK' do
        get "/v1/teams/1"
        expect(response.body).to include_json(
            id: /\d/,
            name: (be_kind_of String),
            code: (be_kind_of String),
            )
        expect(response).to have_http_status(200)
    end
  end

  describe "POST" do
    it "create - 201 Create" do
        params_team = attributes_for(:team)
        params_team[:group_id] = Group.all.sample.id
        post "/v1/teams", params:{team: params_team}
        expect(response.body).to include_json(
            id: /\d/,
            name: params_team.fetch(:name),
            code: params_team.fetch(:code),
            )
        expect(response).to have_http_status(201)
    end
  end

  describe "PUT" do
    it "update - 200 OK" do
        params_team = Team.all.sample
        params_team.name = "Changed"
        params_team.code = "Changed"
        put "/v1/teams/#{params_team.id }", params:{team: params_team.attributes}
        expect(response.body).to include_json(
            id: /\d/,
            name: params_team.name,
            code: params_team.code,
            )
        expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE' do
    it 'delete -204 Not Content' do
        params_team = Team.all.sample
        expect{ delete "/v1/teams/#{params_team.id}" }.to change(Team,:count).by(-1)
    end
  end
end
