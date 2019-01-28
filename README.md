# README

Sweater Weather Backend API 

Hosted on https://morning-dusk-81767.herokuapp.com/

This API is built to serve current, hourly, and daily weather information for any given city. Sweater Weather is a Rails application that consumes the Google Geocode API, Dark Sky API, and Giphy API. 

The endpoints that are available are as follows: 

get /api/v1/forecast?location=denver,co

![forecast](readme_images/ss-forecast.png)

GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json


post /api/v1/users?email=sample&password=test&password_confirmation=test
post /api/v1/sessions?email=sample@email.com&password=test
post /api/v1/favorites?location=denver,co&api_key=abc123
get /api/v1/favorites?api_key=abc123
post /mailers?email=email&location=denver,co
