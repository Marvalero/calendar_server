require 'rack'

module CalendarServer
  module Server
    class Racks
      def initialize(configurator)
        self.endpoints = configurator.endpoints
        self.middlewares = configurator.middlewares
      end

      def main
        _endpoints = endpoints
        _middlewares = middlewares

        Rack::Builder.new do
          use Rack::CommonLogger
          use Rack::ShowExceptions

          map '/events' do
            # use _middlewares.logger
            use _middlewares.create_event_validator
            run _endpoints.events_api
          end

          map '/ping' do
            run _endpoints.ping
          end

          run _endpoints.not_found
        end
      end

      private
      attr_accessor :endpoints, :middlewares
    end
  end
end

