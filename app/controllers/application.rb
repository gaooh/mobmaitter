# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_mobmaitter_session_id'
  session :secret => 'mobmaitter'
  
  layout :basic_layout
  
  def basic_layout
    if request.mobile?
      "mobile"
    else
      'basic'
    end
  end
end
