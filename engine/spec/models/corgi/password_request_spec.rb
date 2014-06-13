require 'spec_helper'

describe Corgi::PasswordRequest do
  context 'set_request' do
    it 'success' do
      @password_request = Corgi::PasswordRequest.new
      @user = create(:user)
      Corgi::PasswordRequest.set_request(@password_request,@user)
      expect(@password_request).to be_valid
    end
  end
end
