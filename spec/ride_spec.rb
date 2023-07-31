require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  describe "#initialize" do
    it "exists" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1).to be_a(Ride)
    end
  end
  
  describe "#name" do
    it "returns name of ride" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1.name).to eq("Carousel")
    end
  end
  
  describe "#min_height" do
    it "returns minimum height of ride" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1.min_height).to eq(24)
    end
  end
  
  describe "#admission_fee" do
    it "returns admission fee of ride" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1.admission_fee).to eq(1)
    end
  end
  
  describe "#excitement" do
    it "returns excitement level of ride" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1.excitement).to eq(:gentle)
    end
  end
  
  describe "#total_revenue" do
    it "returns total revenue of ride" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1.total_revenue).to eq(0)
    end
  end
  
  describe "#total_rides" do
    it "returns total rides of ride" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1.total_rides).to eq(0)

      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1).to be_a(Visitor)
      visitor2 = Visitor.new('Tucker', 36, '$5')
      expect(visitor2).to be_a(Visitor)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      expect(ride1.total_rides).to eq(3)
    end
  end
  describe "#board_rider" do
    it "adds a visitor to the ride" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1).to be_a(Visitor)
      visitor2 = Visitor.new('Tucker', 36, '$5')
      expect(visitor2).to be_a(Visitor)
      
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
      
      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})

      expect(visitor1.spending_money).to eq(8)
      
      expect(visitor2.spending_money).to eq(4)

      expect(ride1.total_revenue).to eq(3)

      visitor3 = Visitor.new('Penny', 64, '$15')
      expect(visitor3).to be_a(Visitor)

      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      expect(ride2).to be_a(Ride)
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      expect(ride3).to be_a(Ride)

      visitor2.add_preference(:thrilling)
      expect(visitor2.preferences).to eq([:gentle, :thrilling])

      visitor3.add_preference(:thrilling)
      expect(visitor3.preferences).to eq([:thrilling])

      ride3.board_rider(visitor1)
      ride3.board_rider(visitor2)
      ride3.board_rider(visitor3)

      expect(visitor1.spending_money).to eq(8)

      expect(visitor2.spending_money).to eq(4)

      expect(visitor3.spending_money).to eq(13)

      expect(ride3.rider_log).to eq({visitor3 => 1})

      expect(ride3.total_revenue).to eq(2)
    end
  end
end