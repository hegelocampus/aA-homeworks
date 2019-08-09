require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  let(:cake) { Dessert.new("pastry", 6, chef)}


  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("pastry")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(6)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients.length).to be(0)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Tart", "seven", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("flour")
      expect(cake.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cake.add_ingredient("flour")
      cake.add_ingredient("sugar")
      cake.add_ingredient("eggs")
      cake.add_ingredient("milk")
      cake.mix!

      expect(cake.ingredients).to_not eq(["flour", "sugar", "eggs", "milk"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(2)
      expect(cake.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(100) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef")
      expect(cake.serve.split).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      #chef = object_spy("Chef") 
      allow(chef).to receive(:bake) { cake }
      cake.make_more
      expect(chef).to have_received(:bake) { cake }
    end
  end
end
