module API
  class Base < Grape::API
  	rescue_from :all, :backtrace => true
  	error_formatter :json, API::V1::ErrorFormatter
  	mount API::V1::Base
  end
end