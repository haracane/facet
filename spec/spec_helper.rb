if RUBY_VERSION <= '1.8.7'
else
  require "simplecov"
  require "simplecov-rcov"
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require "rspec"
require "facet"
require "tempfile"

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

module Facet
  FACET_HOME = File.expand_path(File.dirname(__FILE__) + "/..")
  BIN_DIR = "#{FACET_HOME}/bin"
  LIB_DIR = "#{FACET_HOME}/lib"
  RUBY_CMD = "/usr/bin/env ruby -I #{LIB_DIR}"
  REDIRECT = {}
end

Facet.logger = Logger.new(STDERR)
if File.exist?('/tmp/facet.debug') then
  Facet.logger.level = Logger::DEBUG
  Facet::REDIRECT[:stdout] = nil
  Facet::REDIRECT[:stderr] = nil
else
  Facet.logger.level = Logger::ERROR
  Facet::REDIRECT[:stdout] = "> /dev/null"
  Facet::REDIRECT[:stderr] = "2> /dev/null"
end
