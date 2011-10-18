class ApplicationController < ActionController::Base
  
  before_filter :authorize
  
  protected
  
    def authorize
      if params[:name] == "admin" && params[:password] == "tusDUvt7435"
        session[:admin] = true
      end
    end
end
