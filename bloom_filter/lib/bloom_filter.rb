require 'digest/sha1'
require 'digest/md5'

class BloomFilter

    def initialize(size = 100)
        @bitset = Array.new(size, 0)
    end

    def add(s)
        hash(s).each { |h| @bitset[h] = 1 }
    end
    alias :<< :add

    def test(s)
        hash(s).each { |h| return false unless @bitset[h] == 1 }
        true
    end

private

    def hash(s)
        [
            s.hash % @bitset.size,
            Digest::MD5.digest(s).hash % @bitset.size,
            Digest::SHA1.digest(s).hash % @bitset.size,
        ]
    end

end
