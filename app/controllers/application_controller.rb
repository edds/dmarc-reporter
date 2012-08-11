class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == ENV['SITE_USER'] && password == ENV['SITE_PASS']
      end
    end
  end
end
