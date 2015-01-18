require 'api_contraints'

Rails.application.routes.draw do

# => Api definition
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do
    scope module: :v1 do
      # => resources for api
    end
  end



end
