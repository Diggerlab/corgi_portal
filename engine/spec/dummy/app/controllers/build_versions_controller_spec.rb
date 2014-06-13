require 'spec_helper'

describe Corgi::V1::BuildVersionsController, :type => :controller do
  render_views
  before :each do 
    @version = create(:build_version)
  end
  context 'Version check' do
    it 'should update app' do
      get :index, :use_route => :Corgi, publisher: '1', build: '2', format: :json
      JSON.parse(response.body)["build_version"]["force_update"].should eql false
    end
    it 'update app not necessary' do
      get :index, :use_route => :Corgi, publisher: '1', build: '0', format: :json
      JSON.parse(response.body)["build_version"]["force_update"].should eql true
    end
  end
end
