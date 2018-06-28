require 'rails_helper'

RSpec.describe "Stadiums", type: :request do

  describe "GET" do

    it "index - 200 OK" do
      get "/v1/stadiums"
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        city: (be_kind_of String)])
      expect(response).to have_http_status(200)

    end

    it "show - 200 OK" do
      get "/v1/stadiums/1"
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        city: (be_kind_of String))
        expect(response).to have_http_status(200)

    end
  end

  describe 'POST' do
    it 'create - 201 Create' do
        stadium_params = attributes_for(:stadium)
        post "/v1/stadiums", params: {stadium: stadium_params }
        expect(response.body).to include_json(
            id: /\d/,
            name: stadium_params.fetch(:name),
            city: stadium_params.fetch(:city)
            )
        expect(response).to have_http_status(201)

    end
  end

  describe 'PUT' do
    it 'update - 200 OK' do
        stadium_params = Stadium.all.sample
        stadium_params.name = "Changed"
        stadium_params.city = "Changed"
        put "/v1/stadiums/#{stadium_params.id}", params: {stadium: stadium_params.attributes }
        expect(response.body).to include_json(
            id: /\d/,
            name: stadium_params.name,
            city: stadium_params.city
            )
        expect(response).to have_http_status(200)
    end
  end

    describe 'DELETE' do
        it 'DELETE - 204 No Content' do
            stadium_params = Stadium.all.sample
            if stadium_params.matches.length > 0
                expect{delete "/v1/stadiums/#{stadium_params.id}"}.to raise_error(ActiveRecord::InvalidForeignKey)
            else
                expect{delete "/v1/stadiums/#{stadium_params.id}"}.to change(Stadium, :count).by(-1)
                expect(response).to have_http_status(204)
            end
        end
    end

end
