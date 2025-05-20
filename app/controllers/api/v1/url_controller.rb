
module Api
  module V1
    class UrlController < ActionController::API
      include ShortUrlHelper

      def create
        url = UrlService::Shorten.call(url_params)
    
        return render json: { errors: url.errors.full_messages }, status: :unprocessable_entity unless url.persisted?

        render json: { url_short: short_url(url.short_code) }, status: :created
      end

      def redirect
        @url = Url.find_by_short_code(params[:short_code])

        if @url
          
          UrlVisitService::Track.call(url: @url, request: request)
          @url.increment!(:counter)
          redirect_to @url.url, allow_other_host: true
        else
          render plain: "URL not found", status: :not_found
        end
      end

      private

      def url_params
        params.require(:url).permit(
          :original_url
        )
      end
    end
  end
end