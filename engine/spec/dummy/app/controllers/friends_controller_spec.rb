require 'spec_helper'

describe Corgi::V1::FriendsController, :type => :controller do
  render_views
  before :each do 
    @user = create(:user, email: 'test1@email.com')
    @user2 = create(:user, email: 'test2@email.com')
    @user3 = create(:user, email: 'test3@email.com')
  end

  context 'create friends' do
    it '#post email' do
      post :create, :use_route => :Corgi, token: @user.authentication_token, email: @user2.email, format: :json
      JSON.parse(response.body)['friend']['provider'].should == 'email'
    end

    it '#post code' do
      post :create, :use_route => :Corgi, token: @user.authentication_token, code: @user2.user_code.code, format: :json
      JSON.parse(response.body)['friend']['provider'].should == 'code'
    end

    it '#post failure' do
      expect {
         post :create, token: @user.authentication_token, format: :json
         response.should_not be_ok
        }.to raise_error 
    end
  end

  context 'get friends list' do
    it '#index' do
      friend = create(:friend, user_id: @user.id, friend_user_id: @user2.id, provider: 'code')
      get :index, :use_route => :Corgi, token: @user.authentication_token, format: :json
      JSON.parse(response.body)['corgi_friends'].should_not be_nil
    end
  end

  context 'import friends' do
    it '#import' do
      friends = "     #{@user2.email}, #{@user3.email},     change@test.com"
      post :import, :use_route => :Corgi, token: @user.authentication_token, friends: friends, format: :json
      JSON.parse(response.body)["friends"].count.should eql 2
    end
  end
end
