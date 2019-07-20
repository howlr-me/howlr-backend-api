# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HeartbeatController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get '/heartbeat'
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body).with_indifferent_access
      expect(json[:status]).to eq('ok')
    end
  end
end
