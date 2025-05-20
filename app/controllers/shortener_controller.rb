class ShortenerController < ApplicationController

  include ShortUrlHelper

  def index
    @urls = Url.includes(:url_visits).all
  end

  def new; end

  def create
    @url = UrlService::Shorten.call(url_params)

    if @url.persisted?
      flash[:notice] = "¡URL Shortened!"
      flash[:short_url] = short_url @url.short_code
    else
      flash.now[:alert] = @url.errors.full_messages.join(", ")
    end

    redirect_to root_path
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
