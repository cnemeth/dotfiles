require 'awesome_print'
require 'benchmark'

def time(&block)
  result = nil
  timing = Benchmark.measure do
    result = block.()
  end
  puts "It took: #{timing}"
  result
end
