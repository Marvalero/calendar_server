require_relative 'collection'
require_relative 'mapper'
require_relative 'repository'
require_relative 'entity'
require_relative 'dataset'
require_relative 'actions_tree'

module CalendarServer
  module Events
    class Tree
      include Treefier::Base

      def collection
        @collection ||= CalendarServer::Events::Collection.new(self)
      end

      def mapper
        @mapper ||= CalendarServer::Events::Mapper.new(self)
      end

      def repository
        @repository ||= CalendarServer::Events::Repository.new(self)
      end

      def factory
        @entity ||= CalendarServer::Events::Entity
      end

      def dataset
        @dataset ||= CalendarServer::Events::Dataset.new
      end

      def actions
        @actions ||= CalendarServer::Events::ActionsTree.new(self)
      end
    end
  end
end
