class BloomFilter

    def initialize(bits = 16)
        @bits = bits
        @bitset = Array.new(2 ** @bits, 0)
    end

    def add(s)
        hash(s).each { |h| @bitset[h] = 1 }
    end

    def include?(s)
        hash(s).each { |h| return false unless @bitset[h] == 1 }
        true
    end

private

    def hash(s)
        h1 = s.hash % @bitset.size
        h2 = s.sum(@bits)
        [h1, h2]
    end

end

# Add lots of random strings
length = 10
strings = []
100.times { strings << rand(36 ** length).to_s(36) }

b = BloomFilter.new(8)
strings.each { |s| b.add s }

# Make sure they're all possibly included
strings.each { |s| puts "#{s} should be included but isn't" unless b.include? s }

# Rough check of false positives
other_strings = []
100.times do
    string = rand(36 ** length).to_s(36)
    next if strings.include? string
    other_strings << string
end

fps = 0.0
other_strings.each { |s| fps += 1.0 if b.include? s }
puts "False positive %: #{100 * (fps / other_strings.size)}"
