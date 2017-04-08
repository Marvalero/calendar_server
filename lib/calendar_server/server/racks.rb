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

        Rack::Builder.new do |builder|
          use _middlewares.logger
          map '/events' do |b|
            b.run _endpoints.create_event
          end

          map '/ping' do |b|
            b.run _endpoints.ping
          end

          builder.run _endpoints.not_found
        end
      end

      private
      attr_accessor :endpoints, :middlewares
    end
  end
end

