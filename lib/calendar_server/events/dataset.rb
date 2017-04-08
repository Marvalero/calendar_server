module CalendarServer
  module Events
    class Dataset
      def initialize
        self.data = []
      end

      def insert(record)
        data << record
      end

      private
      attr_accessor :data
    end
  end
end
