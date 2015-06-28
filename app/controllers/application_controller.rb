class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to signin_path, alert: 'You must be logged in to show this page'
  end
end
