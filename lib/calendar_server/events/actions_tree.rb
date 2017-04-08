module CalendarServer
  module Events
    class ActionsTree
      include Treefier::Base

      def create
        @create ||= parent.base_actions.create_class.new(self)
      end
    end
  end
end
