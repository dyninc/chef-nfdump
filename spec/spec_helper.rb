require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/sugar'

RSpec.configure do |config|
  config.formatter = :documentation
  config.color = true
end
