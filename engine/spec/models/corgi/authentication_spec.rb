require 'spec_helper'

describe Corgi::Authentication do
  context 'apply_oauth' do
    it 'success' do
      @auth = Corgi::Authentication.apply_oauth provider: 'sina', nickname: 'daneil', token: 'test', expires_in_sec: '36'
      expect(@auth.token).to eq 'test'
    end
  end
end
