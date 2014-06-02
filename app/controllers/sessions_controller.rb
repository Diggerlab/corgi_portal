class SessionsController < Devise::SessionsController
  layout 'application', only: ['new']
end
