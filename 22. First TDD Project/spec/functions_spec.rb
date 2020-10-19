require 'rspec'
require "functions"

describe Array do
    
    describe "#my_uniq" do
        let(:arr) { [1, 5, 8, 3, 2, 5, 4, 4, 3] }
        let(:uniq_arr) { [1, 5, 8, 3, 2, 4] }
        it "Shouldn't accept parameters" do
            expect { arr.my_uniq }.to_not raise_error
        end
        it "Not allowed use uniq method" do
            expect_any_instance_of(Array).to_not receive(:uniq)
            arr.my_uniq
        end
        it "Returns the unique elements from the given array" do
            expect(arr.my_uniq).to eq(uniq_arr)
        end

        it "does not modify original array" do
            expect {
                arr.my_uniq
            }.to_not change{arr}
        end
    end

    describe "#two_sum" do
        it "Shouldn't accept parameters" do
            expect { [-1, 0, 2, -2, 1].two_sum }.to_not raise_error
        end

        it "Return array of pairs" do
                [-1, 0, 2, -2, 1].two_sum.each do |el|
                    expect(el.length).to eq(2)
                end
        end

        it "Finds pairs of positions where the elements at those positions sum to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    describe "#my_transpose" do
        rows = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]

        it "Shouldn't take a parameter" do
            expect{ rows.my_transpose }.to_not raise_error
        end

        it "Shouldn't use Array#transpose" do
            expect_any_instance_of(Array).to_not receive(:transpose)
        end

        it "Should transpose the matrix" do
            cols = [
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
        ]
            expect(rows.my_transpose).to eq(cols)
        end
    end
end