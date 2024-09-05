require 'rails_helper'
require 'webmock/rspec'

RSpec.describe "Weather API", type: :request do
  before do
    # Stub the external request to OpenWeatherMap API for San Diego
    stub_request(:get, /api.openweathermap.org/)
      .with(query: hash_including(q: "san diego"))
      .to_return(
        status: 200,
        body: {
          name: "San Diego",
          weather: [ { description: "clear sky" } ],
          main: { temp: 22.0 }
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  it "returns weather data for the city" do
    get '/weather/san%20diego'
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)).to include("name" => "San Diego")
  end
end
