class ErrorController < ApplicationController
  VIEWS = {
    404 => 'not_found',
    422 => 'unauthorized',
    500 => 'internal'
  }.freeze

  def show
    render VIEWS.fetch(status_code, 'internal'), status: status_code
  end

  private

  def status_code
    params[:code].to_i || 500
  end
end
