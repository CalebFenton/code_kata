require_relative 'lib/bloom_filter'

# Add lots of random strings
length = lambda { 1 + rand(100) }
count = 5_000
strings = Array.new(count)
count.times { |e| strings[e] = rand(36 ** length.call).to_s(36) }

b = BloomFilter.new(count * 16)
strings.each { |s| b << s }

# Make sure they're all possibly included
strings.each { |s| puts "#{s} should be included but isn't" unless b.test s }

# Rough check of false positives
other_strings = []
count.times do
    string = rand(36 ** length.call).to_s(36)
    next if strings.include? string
    other_strings << string
end

fps = 0
other_strings.each { |s| fps += 1 if b.test s }
puts "False positive %: #{100 * (fps.to_f / other_strings.size)}"
