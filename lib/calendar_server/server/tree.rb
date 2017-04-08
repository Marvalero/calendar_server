require_relative 'racks'
require_relative 'endpoints_tree'
require_relative 'middlewares_tree'

module CalendarServer
  module Server
    class Tree
      include Treefier::Base
      def rack
        @rack ||= CalendarServer::Server::Racks.new(self)
      end

      def endpoints
        @endpoints ||= CalendarServer::Server::EndpointsTree.new(self)
      end

      def middlewares
        @middlewares ||= CalendarServer::Server::MiddlewaresTree.new(self)
      end
    end
  end
end
