module CalendarServer
  module Events
    class Collection
      def initialize(configurator)
        self.repository = configurator.repository
      end

      def <<(event)
        repository.persist event
      end

      private
      attr_accessor :repository
    end
  end
end
