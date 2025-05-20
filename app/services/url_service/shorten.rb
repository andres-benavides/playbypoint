module UrlService
  class Shorten
    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params
    end

    def call
      host = get_domain(@params[:original_url])
      host_parts = host.split(".")

      domain =
        if host_parts.count >= 3
          host_parts[-3]
        else
          host_parts[-2]
        end

      @url = Url.create!(
        url: @params[:original_url],
        domain: domain
      )

      @url
    end

    def get_domain(url)
      uri = URI.parse(url)
      host = uri.host.downcase
      host.start_with?("www.") ? host[4..] : host
    end
  end
end
