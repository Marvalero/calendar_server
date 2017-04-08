require 'spec_helper'

RSpec.describe CalendarServer::Events::CreateEndpoint do
  let(:path) { '/events' }
  let(:start_time) { Time.now.utc.iso8601 }

  def app
    integration_app
  end

  def integration_app
    @integration_app ||= integration_box.server.rack_app
  end

  def do_request
    post path, params
  end

  context 'when corrrect parameters' do
    let(:start_time) { Time.now.utc }
    let(:end_time) { start_time_obj + 2 * 60 * 60 }

    let(:params) do
      {
        name: 'Rockers',
        description: 'amazing gig',
        start_time: start_time.iso8601,
        end_time: end_time.iso8601
      }
    end

    it 'returns 201' do
      do_request
      expect(last_reponse.status).to eq(201)
    end
  end
end
