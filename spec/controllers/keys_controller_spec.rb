require 'rails_helper'

describe KeysController, type: :controller do
  describe "GET #get_available" do
    it "should get any available random key" do
      get :get_available
      json_response = JSON.parse(response.body)
      expect(json_response["key"]).to be_present
      puts json_response
    end
  end
end

describe KeysController, type: :controller do
  describe "GET #get_all_available_keys" do
    it "should get all available keys" do
      get :get_all_available_keys
      json_response = JSON.parse(response.body)
      # expect(json_response["available_keys"]).to be_present
      puts json_response
    end
  end
end

describe KeysController, type: :controller do
  describe "GET #get_all_blocked_keys" do
    it "should get all served keys" do
      get :get_all_blocked_keys
      json_response = JSON.parse(response.body)
      # expect(json_response["blocked_keys"]).to be_present
      puts json_response
    end
  end
end


describe KeysController, type: :controller do
  describe "POST #generate" do
    it "should generate a random key" do
      post :generate
      json_response = JSON.parse(response.body)
      expect(json_response["key"]).to be_present
      puts json_response
    end
  end
end
