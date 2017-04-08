module CalendarServer
  module Server
    class Logger
      def initialize(app)
        self.app = app
      end

      def call(env)
        say "Received call"
        app.call(env).tap do |response|
          say "Finished call"
        end
      end

      private
      attr_accessor :app

      def say(message)
        puts message
      end
    end
  end
end

