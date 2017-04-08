require 'thor'

module CalendarServer
  class Cli < Thor
    desc 'start', 'Runs the server with Puma'
    def start
      app.start
    end

    desc 'console', 'Opens a console with the app'
    def console
      require 'pry'; binding.pry
    end

    private

    def app_tree
      @app_tree ||= AppTree.new
    end

    def app
      @app ||= app_tree.app
    end
  end
end
