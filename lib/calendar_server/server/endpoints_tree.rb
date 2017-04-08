require_relative 'endpoint'

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

      def endpoint_class
        @endpoint_class ||= CalendarServer::Server::Endpoint
      end
    end
  end
end
