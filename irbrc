# Interactive Ruby (irb) configuration.
# 
# A lot of this came from:  http://dancingpenguinsoflight.com/2009/07/improved-irb-configuration/
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

IRB_START_TIME = Time.now

# Print to yaml format with "y"
require 'yaml'
# Pretty printing
require 'pp'
# Ability to load rubygem modules
require 'rubygems'
# Tab completion
require 'irb/completion'
# Save irb sessions to history file
require 'irb/ext/save-history'
require 'pp'

# TODO install these libraries
# # Not stdlib
# require 'map_by_method'
# require 'what_methods'
# # For printing time in session
# require 'duration'
# For coloration

# Return only the methods not present on basic objects
class Object
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end

# # Prints how long the session has been open upon exit
# at_exit { puts Duration.new(Time.now - IRB_START_TIME) }

begin
  # Wirble is a set of enhancements for Irb.  Wirble enables several items mentioned on the RubyGarden "Irb Tips and Tricks" page, including tab-completion, history, and a built-in ri command, as well as colorized results and a couple other goodies. The idea, of course, is to fill Irb with useful features without turning your ~/.irbrc file into swiss cheese.
  require 'wirble'
  
  # ir_black-like color scheme
  colors = {
    # delimiter colors
    :comma              => :white,
    :refers             => :white,

    # container colors (hash and array)
    :open_hash          => :white,
    :close_hash         => :white,
    :open_array         => :white,
    :close_array        => :white,

    # object colors
    :open_object        => :light_red,
    :object_class       => :yellow,
    :object_addr_prefix => :blue,
    :object_line_prefix => :blue,
    :close_object       => :light_red,

    # symbol colors
    :symbol             => :blue,
    :symbol_prefix      => :blue,

    # string colors
    :open_string        => :green,
    :string             => :light_green,
    :close_string       => :green,

    # misc colors
    :number             => :red,
    :keyword            => :cyan,
    :class              => :yellow,
    :range              => :white,
  }

  Wirble.init
  Wirble::Colorize.colors = colors
  Wirble.colorize
rescue
  # Just warn (it's not really a show stopper)
  puts "Warning: could not load 'wirble'"
end

# Include line numbers and indent levels:
IRB.conf[:PROMPT][:SHORT] = {
  :PROMPT_C=>"%03n:%i* ",
  :RETURN=>"%s\n",
  :PROMPT_I=>"%03n:%i> ",
  :PROMPT_N=>"%03n:%i> ",
  :PROMPT_S=>"%03n:%i%l "
}

IRB.conf[:PROMPT_MODE] = :SHORT
# Adds readline functionality
IRB.conf[:USE_READLINE] = true

IRB.conf[:PROMPT_MODE] = :SIMPLE # Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:USE_READLINE] = true # Load the readline module.

# Auto indents suites
IRB.conf[:AUTO_INDENT] = true

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history" 

if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

def time(times = 1)
  require 'benchmark'
  timing = nil
  Benchmark.bm { |x| x.report { times.times { timing = yield } } }
  return timing
end

ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord)

