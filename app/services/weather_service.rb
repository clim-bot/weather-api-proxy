class WeatherService
    include HTTParty
    base_uri "api.openweathermap.org/data/2.5"

    CACHE_EXPIRY = 10.minutes

    def initialize(city)
      @city = city
      @api_key = ENV["OPENWEATHERMAP_API_KEY"]
    end

    def fetch_weather
        cached_weather = $redis.get(cache_key)
        return JSON.parse(cached_weather) if cached_weather

        response = self.class.get("/weather", query: { q: @city, appid: @api_key, units: "metric" })

        if response.headers["X-RateLimit-Remaining"].to_i == 0
          return { error: "Rate limit exceeded. Try again later." }
        end

        if response.success?
          $redis.set(cache_key, response.body, ex: CACHE_EXPIRY)
          response.parsed_response
        else
          nil
        end
    end


    private

    def cache_key
      "weather:#{@city.downcase}"
    end
end
