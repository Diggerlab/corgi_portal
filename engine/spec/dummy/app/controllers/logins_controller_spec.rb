require 'spec_helper'

describe Corgi::V1::LoginsController, :type => :controller do
  render_views
  before :each do 
    @user = create(:user)
  end

  context 'can not login' do

    it 'no email' do
      expect {
        post :create, :use_route => :Corgi, email: nil, format: :json
        response.should_not be_ok
      }.to raise_error
    end

    it 'wrong email' do
      expect {
        post :create, :use_route => :Corgi, email: "daneil@daneil.com", format: :json
        response.should_not be_ok
      }.to raise_error
    end

    it 'wrong password' do
       expect {
        post :create, :use_route => :Corgi, email: @user.email, password: "222222", format: :json
        response.should_not be_ok
      }.to raise_error
    end
  end

  context 'login sucess' do
    it 'email and password are right' do
      post :create, :use_route => :Corgi, email: @user.email, password: '111111', format: :json
      response.should be_ok
    end

    it 'after sucess login give authentication_token' do
      post :create, :use_route => :Corgi, email: @user.email, password: '111111', format: :json
      JSON.parse(response.body)["user"]["authentication_token"].should_not be_nil
    end

    it 'after login updata authentication_token' do
      post :create, :use_route => :Corgi, email: @user.email, password: '111111', format: :json
      #puts JSON.parse(response.body)["user"]["authentication_token"]
      JSON.parse(response.body)["user"]["authentication_token"].should_not == @user.authentication_token
    end
  end
end
