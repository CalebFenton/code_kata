require 'bloom_filter'

describe BloomFilter do
    let('bf') { BloomFilter.new }

    describe '#test' do
        it 'should include strings once added' do
            strings = []
            100.times { strings << rand(36 ** (1 + rand(100))).to_s(36) }
            strings.each { |s| bf.add s }
            strings.each { |s| expect(bf.test(s)).to be true }
        end

        it 'should not include strings that are not added' do
            strings = []
            100.times { strings << rand(36 ** (1 + rand(100))).to_s(36) }
            strings.each { |s| expect(bf.test(s)).to be false }
        end
    end

end
