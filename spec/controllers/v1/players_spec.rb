require 'rails_helper'

describe V1::PlayersController, type: :controller do
    it 'request index with return 200 OK' do
        request.headers["Content-Type"] = "application/json"
        get :index
        expect(response).to have_http_status(:ok)
    end
    # it 'GET v1/players/:id' do
    #     get :show, params {id: }
end
