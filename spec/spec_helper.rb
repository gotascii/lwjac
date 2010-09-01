$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems' # Use the gems path only for the spec suite
require 'spec'
require 'spec/autorun'
require 'lwjac'

# Dir[File.join(File.dirname(__FILE__), "support", "*.rb")].each {|f| require f }

Spec::Runner.configure do |config|
#   config.before(:each) do
#   end
end
