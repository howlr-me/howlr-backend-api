# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::AnnouncementsController, type: :request do
  describe 'loged in member user' do
    let(:auth_param)  { login(create(:user, :member)) }

    it 'returns list of announcements' do
      get '/announcements', as: :json, headers: auth_param

      parsed = JSON.parse(response.body)
      expect(parsed.length).to eq(Announcement.kept.count)
    end

    it 'creates announcement' do
      params = { title: 'Test', details: 'FooBar' }
      post '/announcements', params: params, as: :json, headers: auth_param
      expect(response.status).to eq(200)
    end
  end

  describe 'not logged in' do
    it 'raises an exception' do
      post '/announcements', params: { title: 'Test', details: 'FooBar' }, as: :json
      expect(response.status).to eq(401)
    end
  end
end
