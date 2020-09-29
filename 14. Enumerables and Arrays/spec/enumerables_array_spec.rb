require "rspec"
require "enumerables"
require "prep_iteration_exercises"

describe "#factors" do
  it "returns factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end

describe "#subwords" do
  it "can find a simple word" do
    words = subwords("asdfcatqwer", ["cat", "car"])
    expect(words).to eq(["cat"])
  end

  it "doesn't find spurious words" do
    words = subwords("batcabtarbrat", ["cat", "car"])
    expect(words).to be_empty
  end

  it "can find words within words" do
  #note that the method should NOT return duplicate words
    dictionary = ["bears", "ear", "a", "army"]
    words = subwords("erbearsweatmyajs", dictionary)

    expect(words).to eq(["bears", "ear", "a"])
  end
end

describe Array do
  describe "#bubble_sort!" do
    let(:array) { [1, 2, 3, 4, 5].shuffle }

    it "works with an empty array" do
      expect([].bubble_sort!).to eq([])
    end

    it "works with an array of one item" do
      expect([1].bubble_sort!).to eq([1])
    end

    it "sorts numbers" do
      expect(array.bubble_sort!).to eq(array.sort)
    end

    it "modifies the original array" do
      duped_array = array.dup
      array.bubble_sort!
      expect(duped_array).not_to eq(array)
    end

    it "will use a block if given" do
      sorted = array.bubble_sort! do |num1, num2|
        # order numbers based on descending sort of their squares
        num2**2 <=> num1**2
      end

      expect(sorted).to eq([5, 4, 3, 2, 1])
    end
  end

  describe "#bubble_sort" do
    let(:array) { [1, 2, 3, 4, 5].shuffle }

    it "delegates to #bubble_sort!" do
      expect_any_instance_of(Array).to receive(:bubble_sort!)

      array.bubble_sort
    end

    it "does not modify the original array" do
      duped_array = array.dup
      array.bubble_sort
      expect(duped_array).to eq(array)
    end
  end

  describe "#my_each" do
    it "calls the block passed to it" do
      expect do |block|
        ["test array"].my_each(&block)
      end.to yield_control.once
    end

    it "yields each element to the block" do
      expect do |block|
        ["el1", "el2"].my_each(&block)
      end.to yield_successive_args("el1", "el2")
    end

    it "does NOT call the built-in #each method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:each)
      original_array.my_each {}
    end

    it "is chainable and returns the original array" do
      original_array = ["original array"]
      expect(original_array.my_each {}).to eq(original_array)
    end
  end

  describe "#my_any?" do
    it "calls the block passed to it" do
      expect do |block|
        ["test element"].my_any?(&block)
      end.to yield_control
    end

    it "returns true if any element of the array matched the block condition" do
      test_array = [1, 2, 3, 4, 5]
      expect(test_array.my_any? { |num| num > 1 }).to eq(true)
      expect(test_array.my_any? { |el| el != 1 }).to eq(true)
    end

    it "returns false if all element of the array doesn't the block condition" do
      test_array = [1, 2, 3]
      expect(test_array.my_any? { |num| num == 4 }).to eq(false)
      expect(test_array.my_any? { |num| num < 0 }).to eq(false)
    end

    it "does NOT call the built-in #any? method" do
      test_array = ["el1", "el2", "el3"]
      expect(test_array).not_to receive(:any?)
    end
  end

  describe "#my_select" do
    it "calls the block passed to it" do
      expect do |block|
        [1, 2, 3].my_select(&block)
      end.to yield_control
    end

    it "yields each rejected element to the block" do
      expect do |block|
        ["el1", "el2", "el3"].my_select(&block)
      end.to yield_successive_args("el1", "el2", "el3")
    end

    it "returns an array of filtered down items" do
      test_array = [1, 2, 3]
      expect(test_array.my_select { |num| num > 1 }).to eq([2, 3])
      expect(test_array.my_select { |num| num == 4 }).to eq([])
    end

    it "does NOT call the built-in #reject method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:select)
      original_array.my_select {}
    end
  end

  describe "#my_reject" do
    it "calls the block passed to it" do
      expect do |block|
        [1, 2, 3].my_reject(&block)
      end.to yield_control
    end

    it "yields each rejected element to the block" do
      expect do |block|
        ["el1", "el2", "el3"].my_reject(&block)
      end.to yield_successive_args("el1", "el2", "el3")
    end

    it "returns an array of filtered down items" do
      test_array = [1, 2, 3, 4, 5]
      expect(test_array.my_reject { |num| num > 1 }).to eq([1])
      expect(test_array.my_reject { |num| num == 4 }).to eq([1, 2, 3, 5])
    end

    it "does NOT call the built-in #reject method" do
      original_array = ["original array"]
      expect(original_array).not_to receive(:reject)
      original_array.my_reject {}
    end
  end
end