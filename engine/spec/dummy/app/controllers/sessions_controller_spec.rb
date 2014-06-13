require 'spec_helper'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE unless OpenSSL::SSL.const_defined? :VERIFY_PEER
describe Corgi::V1::SessionsController, :type => :controller do
  render_views
  before :each do 
    @user = create(:user, email: 'test1@email.com')
    @auth = create(:authentication, user_id: @user.id, uid: '111', token: 'test1')
  end
  describe "POST sina_callback" do
    context "with missing parameters" do 
      it "fails with alerts" do
        post :sina_callback, :use_route => :api, token: 'test', format: :json
        response.response_code.should == 401
      end
    end

    context 'sina_callback success' do
      it 'success' do
        post :sina_callback, :use_route => :Corgi, weibo_access_token: '2.00t34dVF0WNxEs763d92c0590oRzcf', expires_in_sec: '123', format: :json
        %(200,201).should include response.code
        JSON.parse(response.body)["auth"]["provider"].should == 'sina'
      end
    end 

    context 'add friends from sina' do
      it 'after authentication' do
        Corgi::Friend.delete_all
        post :sina_callback, :use_route => :Corgi, weibo_access_token: '2.00t34dVF0WNxEs763d92c0590oRzcf', expires_in_sec: '123', format: :json
        @friends = Corgi::Friend.where(provider: 'sina', user_id: @user.id)
        @friends.count.should eql 1
      end
    end
  end



  describe "POST qq_callback" do
    context "qq_callback success" do
      it 'success' do
        post :qq_callback, :use_route => :Corgi, weibo_access_token: '396E3E0FBFB2635428F4CAEAD986F1B8', client_id: '100330589', open_id: '049005BE2B6A55FEF9E95D08E22DCF58', expires_in_sec: '123', format: :json
        %(200,201).should include response.code
        JSON.parse(response.body)["auth"]["provider"].should == 'qq'
      end
    end

    context "with missing parameters" do
      it 'fails' do
        post :qq_callback, :use_route => :Corgi, token: 'test', format: :json
        response.response_code.should == 401
      end
    end
  end
end
