
module CalendarServer
  module Server
    class Endpoint
      def initialize(action:, success_response:)
        self.action = action
        self.success_response = success_response
      end

      def call(env)
        action.call env.params
        success_response
      end

      private
      attr_accessor :action, :success_response
    end
  end
end
