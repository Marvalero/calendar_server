require_relative 'logger'

module CalendarServer
  module Server
    class MiddlewaresTree
      include Treefier::Base
      def logger
        @logger ||= CalendarServer::Server::Logger
      end
    end
  end
end
