class WeatherController < ApplicationController
    def show
      city = params[:city]
      if city.present?
        weather_service = WeatherService.new(city)
        weather_data = weather_service.fetch_weather

        if weather_data
          render json: weather_data
        else
          render json: { error: "Weather data not available" }, status: :bad_request
        end
      else
        render json: { error: "City not provided" }, status: :unprocessable_entity
      end
    end
end
