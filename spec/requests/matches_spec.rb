require 'rails_helper'

RSpec.describe "Matches", type: :request do

  describe "GET" do
    it "index - 200 OK" do
      get "/v1/matches"
      expect(response.body).to include_json([
        id: /\d/,
        date: (be_kind_of String)
      ])
      expect(response).to have_http_status(200)
    end

    it 'show - 200 OK' do
        get "/v1/matches/1"
        expect(response.body).to include_json(
            id: /\d/,
            date: (be_kind_of String)
            )
      expect(response).to have_http_status(200)
    end
  end

  describe "POST" do
    it 'create - 201 Create' do
        params_match = attributes_for(:match)
        params_match[:stadium_id] = Stadium.all.sample.id
        post "/v1/matches", params: {match: params_match}
        expect(response.body).to include_json(
            id: /\d/,
            date: params_match.fetch(:date)
            )
        expect(response).to have_http_status(201)
    end
  end

  describe "PUT" do
    it 'update - 200 OK' do
        params_match = Match.all.sample
        params_match.date = "Changed"
        put "/v1/matches/#{params_match.id}", params: {match: params_match.attributes}
        expect(response.body).to include_json(
            id: /\d/,
            date: params_match.date
            )
        expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE' do
    it 'delete - 204 Not Content' do
        params_match = Match.all.sample
        expect{ delete "/v1/matches/#{params_match.id}"}.to change(Match,:count).by(-1)
        expect(response).to have_http_status(204)
    end
  end

end
