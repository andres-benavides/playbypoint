
module Api
  module V1
    class UrlController < ActionController::API


      def create
        url = UrlService::Shorten.call(url_params)
    
        if url.persisted?
          render json: {url_short: short_url(url.short_code)}, status: :created
        else
          render json: { errors: url.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def redirect
        @url = Url.find_by_short_code(params[:short_code])

        if @url
          @url.increment!(:counter)
          UrlVisitService::Track.call(url: @url, request: request)
          redirect_to @url.url, allow_other_host: true
        else
          render plain: "URL no encontrada", status: :not_found
        end
      end



      private

      def url_params
        params.require(:url).permit(
          :original_url
        )
      end
      def short_url(short_code)
        "#{request.base_url}/s/#{short_code}"
      end
    end
  end
end