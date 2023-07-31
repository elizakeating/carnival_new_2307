require "./lib/visitor"

RSpec.describe Visitor do
  describe "#initialize" do
    it "exists" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(visitor1).to be_a(Visitor)
    end
  end
  
  describe "#name" do
    it "returns name of visitor" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(visitor1.name).to eq("Bruce")
    end
  end
  
  describe "#height" do
    it "returns heigh of visitor" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(visitor1.height).to eq(54)
    end
  end
  
  describe "#spending_money" do
    it "returns spending money of visitor" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(visitor1.spending_money).to eq(10)
    end
  end
  
  describe "#preferences" do
    it "returns array of preferences of visitor" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(visitor1.preferences).to eq([])
    end
  end
  
  describe "#add_preference" do
    it "adds a preference to the visitor" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)
      
      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end
  
  describe "#tall_enough?" do
    it "returns whether or not the visitor is tall enough based on a given height" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64)).to eq(false)
    end
  end
end