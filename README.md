# Weather API Proxy

## Description

Weather API Proxy is a simple Ruby on Rails API application that pulls weather data from the [OpenWeatherMap API](https://openweathermap.org/api) and serves it to users. It supports querying the current weather by city and caches the results to reduce external API calls. 

### Features:
- Fetch current weather based on a city (e.g., San Diego).
- Cache weather data for a short period using Redis to reduce the number of API calls.
- Mocking of external API calls in tests using WebMock.

## Learning Outcomes:
- Interacting with external APIs (OpenWeatherMap).
- Implementing caching strategies with Redis.
- Writing unit tests with RSpec and WebMock.
- Managing rate limits and error handling in external API requests.

---

## Prerequisites

- Ruby (version 3.1.2 or higher)
- Rails (version 7.0 or higher)
- PostgreSQL (for development and test environments)
- Redis (for caching)
- Bundler (for managing Ruby gems)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/weather-api-proxy.git
cd weather-api-proxy
```

### 2. Install Dependencies
Run the following command to install the required gems:
```bash
bundle install
```

### 3. Set Up Environment Variables
Create a .env file in the root directory of the project, and add your OpenWeatherMap API key:
```bash
touch .env
```

Add the following environment variable to the .env file:
```makefile
OPENWEATHERMAP_API_KEY=your_openweathermap_api_key
```

### 4. Configure the Database
Set up your PostgreSQL database by running:
```bash
rails db:create
rails db:migrate
```

### 5. Start Redis (for caching)
Make sure Redis is running on your machine. If you're using macOS, you can start Redis using Homebrew:
```bash
brew install redis
brew services start redis
```

### 6. Start the Rails Server
Once everything is set up, start the Rails server:
```bash
rails s
```

By default, the API will be running at `http://localhost:3000`.

## API Endpoints
### Fetch Weather by City
- GET /weather/
Fetches the current weather for a specified city.

**Example Request**
```bash
curl http://localhost:3000/weather/san%20diego
```

**Example Response**
```json
{
  "name": "San Diego",
  "weather": [
    { "description": "clear sky" }
  ],
  "main": {
    "temp": 22.0
  }
}
```

**Error Handling**
If the API rate limit is exceeded or another error occurs, the response will contain an error message:
```json
{
  "error": "Rate limit exceeded. Try again later."
}
```

## Running Tests
This project uses RSpec for testing. The tests mock external API calls to OpenWeatherMap using WebMock to prevent real API calls during testing.

### Running All Tests
```bash
bundle exec rspec
```

### Running a Specific Test
```bash
bundle exec rspec spec/requests/weather_spec.rb
```

## Caching

The weather data is cached in Redis for 10 minutes to minimize the number of API requests made to OpenWeatherMap. You can modify the cache expiration time in the WeatherService class if needed.

### Clear the Redis Cache
ou can manually clear the Redis cache by running:
```bash
redis-cli FLUSHALL
```

## Troubleshooting
### Common Errors:
1. Missing OpenWeatherMap API Key: Ensure that your .env file contains a valid API key.
2. Redis Not Running: If you encounter caching issues, make sure Redis is installed and running on your machine.
3. Database Errors: Ensure PostgreSQL is properly set up and the database has been migrated using rails db:migrate.

## Deployment
### Heroku
To deploy this application to Heroku, follow these steps:
1. Create a Heroku App:
```bash
heroku create
```

2. Set the OpenWeatherMap API Key:
```bash
heroku config:set OPENWEATHERMAP_API_KEY=your_openweathermap_api_key
```

3. Deploy to Heroku:
```bash
git push heroku master
```

4. Run Database Migrations:
```bash
heroku run rails db:migrate
```
