require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Usama") }
  let(:toffee) { Dessert.new("toffee", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(toffee.type).to eq("toffee")
    end
    it "sets a quantity" do
      expect(toffee.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(toffee.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("toffee", "hundered", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      toffee.add_ingredient("cacao")
      expect(toffee.ingredients).to include("cacao")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["floot", "quiew", "fdfe", "Powr"]
      ingredients.each do |ingredient|
        toffee.add_ingredient(ingredient)
      end
      expect(toffee.ingredients).to eq(ingredients)
      toffee.mix!
      expect(toffee.ingredients).to_not eq(ingredients)
      expect(toffee.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      toffee.eat(10)
      expect(toffee.quantity).to eq(90)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ toffee.eat(101) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Usama the Great Baker")
      expect(toffee.serve).to eq("Chef Usama the Great Baker has made 100 toffees!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(toffee)
      toffee.make_more
    end
  end
end
