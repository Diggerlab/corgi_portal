require 'spec_helper'
describe Corgi::V1::FeedbacksController, :type => :controller do
  render_views
  before :each do 
    @user = create(:user, email: 'test@test.com', authentication_token: 'test')
  end
  context 'index' do
    it 'show all feedbacks' do
      @feedback1 = create(:feedback, user_id: @user.id)
      @feedback2 = create(:feedback, user_id: @user.id)

      get :index, :use_route => :Corgi, token: "#{@user.authentication_token}", format: :json
      JSON.parse(response.body)["corgi_feedbacks"].first["corgi_feedback"]['content'].should == 'feedback'
    end
  end
end
