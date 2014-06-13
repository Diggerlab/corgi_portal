require "spec_helper"
  describe 'test routes' do
    routes { Corgi::Engine.routes }
    context 'user_routes' do
      it 'routes to users#index' do
         get('v1/users').should route_to(:controller => "corgi/v1/users", :action => "index")
      end

      it 'routes to users#new' do
        get('v1/users/new').should route_to(:controller => "corgi/v1/users", :action => "new")
      end

      it 'routes to users#create' do
        post('v1/users').should route_to(:controller => "corgi/v1/users", :action => "create")
      end

      it 'routes to users#change_password' do
        get('v1/users/:token/change_password').should route_to(:controller => "corgi/v1/users", :action => "change_password", :token => ":token")
      end

      it 'routes to users#update_password' do
        post('v1/users/:token/change_password').should route_to(:controller => "corgi/v1/users", :action => "update_password", :token => ":token")
      end
    end

    context 'sessions_routes' do
      it 'routes to sessions#qq_callback' do
        post('v1/sessions/qq_callback').should route_to(:controller => "corgi/v1/sessions", :action => "qq_callback")
      end

      it 'routes to sessions#sina_callback' do
        post('v1/sessions/sina_callback').should route_to(:controller => "corgi/v1/sessions", :action => "sina_callback")
      end
    end

    context 'responses_routes' do
      it 'routes to responses#qq_callback' do
        get('v1/feedbacks/:feedback_id/responses/new').should route_to(:controller => "corgi/v1/responses", :action => "new", :feedback_id => ":feedback_id")
      end

      it 'routes to responses#sina_callback' do
        post('v1/feedbacks/:feedback_id/responses').should route_to(:controller => "corgi/v1/responses", :action => "create", :feedback_id => ":feedback_id")
      end
    end

    context 'recharges_routes' do
      it 'routes to recharges#index' do
        get('v1/recharges').should route_to(:controller => "corgi/v1/recharges", :action => "index")
      end

      it 'routes to recharges#create' do
        post('v1/recharges').should route_to(:controller => "corgi/v1/recharges", :action => "create")
      end
    end

    context 'password_requests_routes' do
      it 'routes to password_requests#new_password' do
        get('v1/password_requests/new').should route_to(:controller => "corgi/v1/password_requests", :action => "new")
      end

      it 'routes to password_requests#create' do
        post('v1/password_requests').should route_to(:controller => "corgi/v1/password_requests", :action => "create")
      end

      it 'routes to password_requests#new_password' do
        get('v1/password_requests/new_password').should route_to(:controller => "corgi/v1/password_requests", :action => "new_password")
      end

      it 'routes to password_requests#change_password' do
        post('v1/password_requests/new_password').should route_to(:controller => "corgi/v1/password_requests", :action => "change_password")
      end
    end

    context 'notices_routes' do
      it 'routes to notices#index' do
        get('v1/notices').should route_to(:controller => "corgi/v1/notices", :action => "index")
      end
    end

    context 'logins_routes' do
      it 'routes to logins#login' do
        get('v1/login').should route_to(:controller => "corgi/v1/logins", :action => "login")
      end

      it 'routes to logins#create' do
        post('v1/login').should route_to(:controller => "corgi/v1/logins", :action => "create")
      end
    end

    context 'friends_routes' do
      it 'routes to friends#login' do
        get('v1/friends').should route_to(:controller => "corgi/v1/friends", :action => "index")
      end

      it 'routes to friends#create' do
        post('v1/friends').should route_to(:controller => "corgi/v1/friends", :action => "create")
      end

      it 'routes to friends#import' do
        post('v1/friends/import').should route_to(:controller => "corgi/v1/friends", :action => "import")
      end
    end

    context 'feedbacks_routes' do
      it 'routes to feedbacks#index' do
        get('v1/feedbacks').should route_to(:controller => "corgi/v1/feedbacks", :action => "index")
      end

      it 'routes to feedbacks#create' do
        post('v1/feedbacks').should route_to(:controller => "corgi/v1/feedbacks", :action => "create")
      end

      it 'routes to feedbacks#new' do
        get('v1/feedbacks/new').should route_to(:controller => "corgi/v1/feedbacks", :action => "new")
      end
    end

    context 'build_versions_routes' do
      it 'routes to build_versions#index' do
        get('v1/build_versions').should route_to(:controller => "corgi/v1/build_versions", :action => "index")
      end
    end

  end



