require_relative 'create_event_validator'

module CalendarServer
  module Server
    class MiddlewaresTree
      include Treefier::Base

      def create_event_validator
        @logger ||= CalendarServer::Server::CreateEventValidator
      end
    end
  end
end
