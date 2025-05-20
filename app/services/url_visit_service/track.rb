module UrlVisitService
  class Track
    def self.call(url:, request:)
      new(url, request).call
    end

    def initialize(url, request)
      @url = url
      @request = request
    end

    def call
      @url.url_visits.create!(
        ip_address: @request.remote_ip
      )
    end
  end
end
