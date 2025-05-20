module ShortUrlHelper
  extend ActiveSupport::Concern

  def short_url(short_code)
    "#{request.base_url}/s/#{short_code}"
  end
end
