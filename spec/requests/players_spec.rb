require 'rails_helper'

RSpec.describe "Players", type: :request do

  describe "GET" do
    it 'index - 200 OK' do
        get "/v1/players"
        expect(response.body).to include_json([
            id: /\d/,
            name: (be_kind_of String),
            position: (be_kind_of String),
            age: /\d/
        ])
    end

    it 'show -- 200 OK' do
        get "/v1/players/1"
        expect(response.body).to include_json(
            id: /\d/,
            name: (be_kind_of String),
            position: (be_kind_of String),
            age: /\d/
            )
    end
  end

  describe 'POST' do
    it 'create - 201 Create' do
        params_player = attributes_for(:player)
        params_player[:team_id] = Team.all.sample.id
        post '/v1/players', params: {player: params_player}
        expect(response.body).to include_json(
            id: /\d/,
            name: params_player.fetch(:name),
            position: params_player.fetch(:position),
            age: params_player.fetch(:age)
        )
        expect(response).to have_http_status(201)
    end
  end

  describe 'PUT' do
    it 'update - 200 OK' do
        params_player = Player.all.sample
        params_player.name = "Changed"
        params_player.position = "Changed"
        params_player.age = "Change"
        put "/v1/players/#{params_player.id}", params: {player: params_player.attributes}
        expect(response.body).to include_json(
            id: /\d/,
            name: params_player.name,
            position: params_player.position,
            age: params_player.age
            )
    end
  end

  describe 'DELETE' do
    it 'delete - 204 Not Content' do
        params_player = Player.all.sample
        expect{ delete "/v1/players/#{params_player.id}"}.to change(Player,:count).by(-1)
        expect(response).to have_http_status(204)
    end
  end
end
