# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::CulturesController, type: :request do
  describe 'loged in member user' do
    before do
      @auth_param = login(create(:user, :member))
    end

    it 'creates new culture' do
      post '/v1/cultures', params: { name: 'Foo' }, as: :json, headers: @auth_param
      expect(response).to have_http_status(:success)
    end
  end
end
