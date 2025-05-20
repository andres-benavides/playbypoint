module UrlVisitService
  class Track
    def self.call(url:, request:)
      url.url_visits.create!(
        ip_address: request.remote_ip,
      )
    end
  end
end
