# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_host
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to(request.referrer || root_path)
    end

    def set_host
      ActionMailer::Base.default_url_options = {
        host: request.protocol + request.host_with_port
      }
      ActionMailer::Base.asset_host = request.protocol + request.host_with_port
    end
end
