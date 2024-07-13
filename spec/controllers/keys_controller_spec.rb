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

describe KeysController, type: :controller do
  describe "PUT #unblock" do
    let!(:blocked_key) { create(:key, status: 'blocked') }

    it "unblocks a key" do
      put :unblock, params: { key_value: blocked_key.value }

      json_response = JSON.parse(response.body)
      expect(json_response["key"]).to eq(blocked_key.value)
      expect(blocked_key.reload.status).to eq('active')
    end

    it "returns not found for unavailable key" do
      put :unblock, params: { key_value: 'unavailable_key' }

      expect(response).to have_http_status(:not_found)
    end
  end
end

describe KeysController, type: :controller do
  describe "DELETE #delete" do
    let!(:key_to_delete) { create(:key) }

    it "deletes a key" do
      expect {
        delete :delete, params: { key_value: key_to_delete.value }
      }.to change(Key, :count).by(-1)
    end

    it "returns not found for unavailable key" do
      delete :delete, params: { key_value: 'unavailable_key' }

      expect(response).to have_http_status(:not_found)
    end
  end
end
