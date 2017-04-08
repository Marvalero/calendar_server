require_relative 'create'

module CalendarServer
  module BaseActions
    class Tree
      include Treefier::Base

      def create_class
        @create ||= CalendarServer::BaseActions::Create
      end
    end
  end
end
