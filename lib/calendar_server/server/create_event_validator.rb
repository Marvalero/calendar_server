module CalendarServer
  module Server
    class CreateEventValidator
      PARAMS = 'params'.freeze

      START_TIME = 'start_time'.freeze
      END_TIME = 'end_time'.freeze
      NAME = 'name'.freeze
      DESCRIPTION = 'description'.freeze

      RESPONSE_HEADERS = { 'Content-Type'.freeze => 'text/plain'.freeze }.freeze
      RESPONSE_BODY = ''.freeze

      def initialize(app)
        self.app = app
      end

      def call(env)
        params = env[PARAMS]
        return [400, RESPONSE_HEADER, RESPONSE_BODY] unless validate_params(params)
        env[PARAMS] =  parse_params(params)
        app.call env
      end

      private
      attr_accessor :app

      def parse_params(params)
        {
          start_time: params[START_TIME],
          end_time: params[END_TIME],
          name: params[NAME],
          description: params[DESCRIPTION]
        }
      end

      def validate_params(params)
        params[START_TIME] && params[END_TIME] && params[NAME]
      end
    end
  end
end
