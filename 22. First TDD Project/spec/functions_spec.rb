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
        let(:arr) { [-1, 0, 2, -2, 1] }
        let(:arr_has_zeros) { [-1, 0, 2, -2, 1, 0] }
        it "Shouldn't accept parameters" do
            expect { arr.two_sum }.to_not raise_error
        end

        it "Return array of pairs" do
                arr.two_sum.each do |el|
                    expect(el.length).to eq(2)
                end
        end

        it "Finds pairs of positions where the elements at those positions sum to zero" do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end

        it "Works well with two zeros" do
            expect(arr_has_zeros.two_sum).to eq([[0, 4], [1, 5], [2, 3]])
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

    describe "#pick_stocks" do
        let(:arr1) { [3, 1, 0, 4, 6, 9] }
        let(:arr2) { [3, 2, 5, 0, 6] }
        let(:arr3) { [4, 3, 2, 1] }
        it "finds a simple pair" do
            expect(arr1.pick_stocks).to eq([2, 5])
        end

        it "finds a better pair after an inferior pair" do
            expect(arr2.pick_stocks).to eq([3, 4])
        end

        it "does not buy stocks in a crash" do
            expect(arr3.pick_stocks).to be_nil
        end
    end
end