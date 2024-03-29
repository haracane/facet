require "logger"
require "erb"
require "facet/command/build"

module Facet
  TEMPLATES_DIR = File.expand_path(File.join(File.dirname(__FILE__), "facet", "templates"))
  
  def self.to_camel_case(str)
    return str.split('_').map{|word| word.capitalize}.join
  end
  
  def self.logger
    if @logger.nil?
      @logger = (rails_logger || default_logger)
      @logger.formatter = proc { |severity, datetime, progname, msg|
        datetime.strftime("[%Y-%m-%d %H:%M:%S](#{severity})#{msg}\n")
      }
    end
    return @logger
  end

  def self.rails_logger
    (defined?(Rails) && Rails.respond_to?(:logger) && Rails.logger) ||
    (defined?(RAILS_DEFAULT_LOGGER) && RAILS_DEFAULT_LOGGER.respond_to?(:debug) && RAILS_DEFAULT_LOGGER)
  end

  def self.default_logger
    l = Logger.new(STDERR)
    l.level = Logger::INFO
    l
  end

  def self.logger=(logger)
    @logger = logger
  end
end
