module CalendarServer
  module Events
    class Mapper
      def initialize(configurator)
        self.factory = configurator.factory
      end

      def load(record)
        factory.new(entity_attributes(record))
      end

      def dump(entity)
        {
          uuid: entity.uuid,
          name: entity.name,
          description: entity.description,
          start_time: entity.start_time,
          end_time: entity.end_time,
        }
      end

      private
      attr_accessor :factory

      def entity_attributes(record)
        {
          uuid: record[:uuid],
          name: record[:name],
          description: record[:description],
          start_time: record[:start_time],
          end_time: record[:end_time],
        }
      end
    end
  end
end
