require 'run_length'

describe RunLength do

    describe '#get' do
        let('get') { RunLength.get(string) }

        context 'with an empty string' do
            let('string') { '' }
            subject{ get }
            it { should eq '' }
        end

        context 'with "a"' do
            let('string') { 'a' }
            subject{ get }
            it { should eq '1a' }
        end

        context 'with "aa"' do
            let('string') { 'aa' }
            subject{ get }
            it { should eq '2a' }
        end

        context 'with "aab"' do
            let('string') { 'aab' }
            subject{ get }
            it { should eq '2a1b' }
        end

        context 'with "aaaabcccccccccdddddz"' do
            let('string') { 'aaaabcccccccccdddddz' }
            subject{ get }
            it { should eq '4a1b9c5d1z' }
        end
    end

end
