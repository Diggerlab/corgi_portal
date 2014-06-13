require 'spec_helper'

describe Corgi::V1::PasswordRequestsController, :type => :controller do
  before :each do 
    @user = create(:user, email: 'test@test.com')
  end
  context 'can not send mail' do
    it 'wrong email' do
      expect {
        @password_request = create(:password_request, email: 'g@g.com', user_id: @user.id)
        post :create, :use_route => :Corgi, password_request: @password_request.attributes, format: :json
        response.should_not be_ok
      }.to raise_error
    end
    it 'email is nil' do
      expect {
        @password_request = create(:password_request, email: '', user_id: @user.id)
        post :create, :use_route => :Corgi, password_request: @password_request.attributes, format: :json
        response.should_not be_ok
      }.to raise_error
    end
  end

  context 'email and captcha are right' do
    it 'send email success' do
      post :create, :use_route => :Corgi, email: @user.email, format: :json
      response.should be_ok
    end
  end

  context '#new_password' do
    it 'click link erro with token' do
      expect {
        @password_request = create(:password_request, token: 'qweqweqwe', user_id: @user.id, state: 'pending')
        get :new_password, :use_route => :Corgi, token: 'qqqqqqqq', format: :html
        response.should_not be_ok
      }.to raise_error
    end

    it 'click link true' do
      @password_request = create(:password_request, token: 'qweqweqwe', user_id: @user.id, state: 'pending')
      get :new_password, :use_route => :Corgi, token: 'qweqweqwe', format: :html
      puts response
      response.should be_ok
    end
  end

  context '#change_password' do
    it 'set password is wong' do
      expect {
        @password_request = create(:password_request, user_id: @user.id, token: 'qweqweqwe')
        post :change_password, :use_route => :Corgi, token: 'qweqweqwe', change_password: '111', format: :json
        response.should_not be_ok
      }.to raise_error
    end
    it 'change_password again is not allowed' do
      expect {
        @password_request = create(:password_request, user_id: @user.id, token: 'qweqweqwe', state: 'finished')
        post :change_password, :use_route => :Corgi, token: 'qweqweqwe', change_password: '2222222', format: :json
        response.should_not be_ok
      }.to raise_error
    end
    it 'set password success' do
      @password_request = create(:password_request, user_id: @user.id, token: 'qweqweqwe')
      post :change_password, :use_route => :Corgi, :password_request => {:token => 'qweqweqwe'}, change_password: '222222', format: :json
      response.should be_ok
    end
  end
end
