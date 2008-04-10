# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :adjust_format_for_iphone

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '86e1cd796a692109fec05af2eccaf4cb'

  private

  # Set iPhone format for all requests
  def adjust_format_for_iphone    
    request.format = :iphone
  end
end
