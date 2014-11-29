class ApiKeyController < ApplicationController

  respond_to :js

  def soundcloud
    respond_with(Rails.application.secrets.soundcloud_api_key)
  end

  # def youtube
  #   Rails.application.secrets.youtube_api_key
  # end
end
