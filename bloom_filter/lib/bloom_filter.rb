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
