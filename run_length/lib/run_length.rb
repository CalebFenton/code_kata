class RunLength

    def self.get(string)
        counts = Hash.new(0)
        string.each_char { |l| counts[l] += 1 }
        counts.map { |l, c| "#{c}#{l}" }.join
    end

end
