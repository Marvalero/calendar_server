module CalendarServer
  module Events
    class Repository
      def initialize(configurator)
        self.mapper = configurator.mapper
        self.dataset = configurator.dataset
      end

      def persist(entity)
        mapper.dump(entity).tap do |record|
          dataset.insert(record)
        end
      end

      private
      attr_accessor :mapper, :dataset
    end
  end
end
