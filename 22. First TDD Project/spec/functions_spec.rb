require 'rspec'
require "functions"

describe Array do
    
    describe "#my_uniq" do
        it "Shouldn't accept parameters" do
            expect { [1, 4, 6] }.to_not raise_error
        end
        it "Not allowed use uniq method" do
            expect_any_instance_of(Array).to_not receive(:uniq)
            [1, 5, 3].my_uniq
        end
        it "Returns the unique elements from the given array" do
            expect([1, 5, 8, 3, 2, 5, 4, 4, 3].my_uniq).to eq([1, 5, 8, 3, 2, 4])
        end
    end
end