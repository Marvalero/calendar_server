require_relative 'app'
require_relative 'server/tree'
require_relative 'base_actions/tree'
require_relative 'events/tree'
require 'yaml'

module CalendarServer
  class AppTree
    def base_actions
      @base_actions ||= CalendarServer::BaseActions::Tree.new(self)
    end

    def server
      @server ||= CalendarServer::Server::Tree.new(self)
    end

    def events
      @events ||= CalendarServer::Events::Tree.new(self)
    end

    def app
      @app ||= CalendarServer::App.new(self)
    end

    def config
      @config ||= YAML.load_file('config/application.yml')
    end
  end
end
