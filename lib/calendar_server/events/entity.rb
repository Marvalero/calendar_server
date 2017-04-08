module CalendarServer
  module Events
    class Entity
      attr_accessor :uuid, :name, :start_time, :end_time, :description

      def initialize(args)
        self.uuid = args[:uuid]
        self.name = args[:name]
        self.start_time = args[:start_time]
        self.end_time = args[:end_time]
        self.description = args[:description]
      end

      def self.build(args)
        new(args)
      end
    end
  end
end
