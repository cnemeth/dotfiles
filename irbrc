# Interactive Ruby (irb) configuration.
# 
# A lot of this came from:  http://dancingpenguinsoflight.com/2009/07/improved-irb-configuration/
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'yaml' # Print to yaml format with "y"
require 'pp' # Pretty printing
require 'rubygems' # Ability to load rubygem modules
require 'irb/completion' # Tab completion
require 'irb/ext/save-history' # Save irb sessions to history file

# Return only the methods not present on basic objects
class Object
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end

def time(times = 1)
  require 'benchmark'
  timing = nil
  Benchmark.bm { |x| x.report { times.times { timing = yield } } }
  return timing
end

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

IRB.conf[:PROMPT_MODE] = :SHORT
IRB.conf[:USE_READLINE] = true # Adds readline functionality

IRB.conf[:PROMPT_MODE] = :SIMPLE # Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:USE_READLINE] = true # Load the readline module.

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history" 
