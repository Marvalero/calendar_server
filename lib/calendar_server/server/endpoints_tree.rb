require_relative 'endpoint'
require_relative 'api'

module CalendarServer
  module Server
    class EndpointsTree
      include Treefier::Base
      RESPONSE_HEADERS = { 'Content-Type'.freeze => 'text/plain'.freeze }.freeze
      CREATE_RESPONSE = [201.freeze, RESPONSE_HEADERS, [''].freeze].freeze
      PING_RESPONSE = [200.freeze, RESPONSE_HEADERS, ['pong'].freeze].freeze
      NOT_FOUND_RESPONSE = [404.freeze, RESPONSE_HEADERS, ['Not Found'].freeze].freeze

      def create_event
        @create_event ||= build_endpoint(self.events.actions.create,
                                         CREATE_RESPONSE)
      end

      def events_api
        @events_api ||= build_api(create: create_event)
      end

      def ping
        @ping ||= build_endpoint(-> (_params) {},
                                 PING_RESPONSE)
      end

      def not_found
        @not_found ||= build_endpoint(-> (_params) {},
                                   NOT_FOUND_RESPONSE)
      end

      private

      def build_endpoint(action, success_response)
        endpoint_class.new(action: action, success_response: success_response)
      end

      def build_api(create: nil, update: nil, read: nil, delete: nil)
        api_class.new(create_endpoint: create,
                      delete_endpoint: delete,
                      update_endpoint: update,
                      read_endpoint: read,
                      error_response: NOT_FOUND_RESPONSE)
      end

      def api_class
        @api_class ||= CalendarServer::Server::Api
      end

      def endpoint_class
        @endpoint_class ||= CalendarServer::Server::Endpoint
      end
    end
  end
end
