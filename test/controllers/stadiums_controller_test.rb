require 'test_helper'

class StadiumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stadium = stadiums(:one)
  end

  test "should get index" do
    get stadiums_url, as: :json
    assert_response :success
  end

  test "should create stadium" do
    assert_difference('Stadium.count') do
      post stadiums_url, params: { stadium: { city: @stadium.city, name: @stadium.name } }, as: :json
    end

    assert_response 201
  end

  test "should show stadium" do
    get stadium_url(@stadium), as: :json
    assert_response :success
  end

  test "should update stadium" do
    patch stadium_url(@stadium), params: { stadium: { city: @stadium.city, name: @stadium.name } }, as: :json
    assert_response 200
  end

  test "should destroy stadium" do
    assert_difference('Stadium.count', -1) do
      delete stadium_url(@stadium), as: :json
    end

    assert_response 204
  end
end
