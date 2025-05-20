module UrlService
  class Shorten
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @original_url = params[:original_url]
    end

    def call
      Url.create!(
        url: @original_url,
        domain: extract_domain(@original_url)
      )
    end

    private

    def extract_domain(url)
      uri = URI.parse(url)
      host = uri.host.downcase
      host = host[4..] if host.start_with?("www.")
      parts = host.split(".")
      parts.length >= 3 ? parts[-3] : parts[-2]
    end
  end
end
