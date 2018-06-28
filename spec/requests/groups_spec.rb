require 'rails_helper'

RSpec.describe "Groups", type: :request do

  describe "GET" do

    it 'index - 200 OK' do
        get '/v1/groups'
        expect(response.body).to include_json([
            id: /\d/,
            name: (be_kind_of String)
        ])
        expect(response).to have_http_status(200)
    end
    it 'show - 200 OK' do
        get '/v1/groups/1'
        expect(response.body).to include_json(
            id: /\d/,
            name: (be_kind_of String))
        expect(response).to have_http_status(200)
    end
  end

  describe 'POST' do
    it 'create - 201 Create' do
        params_group = attributes_for(:group)
        post '/v1/groups', params: {group: params_group}
        expect(response.body).to include_json(
            id: /\d/,
            name: params_group.fetch(:name)
        )
        expect(response).to have_http_status(201)
    end

    describe 'PUT' do
        it 'update - 200 OK' do
            params_group = Group.all.sample
            params_group.name = "Changed"
            put "/v1/groups/#{params_group.id}", params: {group: params_group.attributes}
            expect(response.body).to include_json(
                id: /\d/,
                name: params_group.name
                )
            expect(response).to have_http_status(200)
        end
    end

    describe 'DELETE' do
        it 'delete - 204 Not Content' do
            params_group = Group.all.sample
            if params_group.teams.length > 0
                expect{ delete "/v1/groups/#{params_group.id}"}.to raise_error(ActiveRecord::InvalidForeignKey)
            else
                expect{delete "/v1/groups/#{params_group.id}"}.to change(Group,:count).by(-1)
                expect(response).to have_http_status(204)
            end
        end
    end
  end
end
