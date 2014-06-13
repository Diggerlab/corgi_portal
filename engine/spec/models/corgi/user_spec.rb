require 'spec_helper'

describe Corgi::User do
  context 'authenticate_user' do
    it 'init_user success' do
      @user = create(:user)
      @user.state.should eq 'pending'
    end

    it 'authentication_user! success' do
      @user = create(:user)
      email = @user.email
      expect(Corgi::User.authentication_user!(email,'111111')).to be_valid
    end

    it 'authentication_password success' do
      @user = create(:user)
      expect(Corgi::User.authentication_password(@user,'111111')).to eq true
    end

    it 'default_user success' do
      @aut = create(:authentication)
      expect(Corgi::User.default_user(@aut.provider, @aut.token).state).to eq 'pending'
    end
  end
  context 'after_create create user_code' do
    it 'success' do
       @user = create(:user)
       @user.user_code.should_not be_nil
    end
  end

  context 'after_create create accounts' do
    it 'success' do
       @user = create(:user)
       @user.account.should_not be_nil
    end
  end
end
