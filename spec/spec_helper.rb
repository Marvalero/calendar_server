require 'rspec'
require 'pry'

RSpec.configure do |c|
  c.disable_monkey_patching!
  c.filter_run_excluding integration: (ENV['INT'] != 'true')
  c.color = true
end

