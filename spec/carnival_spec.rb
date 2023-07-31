require "./lib/visitor"
require "./lib/ride"
require "./lib/carnival"

RSpec.describe Carnival do
  describe "#initialize" do
    it "exists" do
      carnival1 = Carnival.new(18)

      expect(carnival1).to be_a(Carnival)
    end
  end
  
  describe "#duration" do
    it "returns carnival duration" do
      carnival1 = Carnival.new(18)
      
      expect(carnival1.duration).to eq(18)
    end
  end
  
  describe "#rides" do
    it "returns array of carnival rides" do
      carnival1 = Carnival.new(18)

      expect(carnival1.rides).to eq([])
    end
  end
  
  describe "#add_ride" do
    it "adds ride to the carnival" do
      carnival1 = Carnival.new(18)
      
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      carnival1.add_ride(ride1)
      
      expect(carnival1.rides).to eq([ride1])
      
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)
      
      expect(carnival1.rides).to eq([ride1, ride2, ride3])
    end
  end
  
  describe "#most_popular_ride" do
    it "returns the most popular ride" do
      carnival1 = Carnival.new(18)

      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      visitor1.add_preference(:gentle)
      
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)

      visitor3.add_preference(:gentle)
      
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor3)

      ride3.board_rider(visitor2)

      expect(carnival1.most_popular_ride).to eq(ride1)
    end
  end

  describe "#most_profitable_ride" do
    it "returns the most profitable ride" do
      carnival1 = Carnival.new(18)

      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      visitor1.add_preference(:gentle)
      
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)

      visitor3.add_preference(:gentle)
      
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor3)

      ride3.board_rider(visitor2)

      expect(carnival1.most_profitable_ride).to eq(ride2)
    end
  end

  describe "#total_revenue" do
    it "returns total revenue of carnival" do
      carnival1 = Carnival.new(18)

      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      visitor1.add_preference(:gentle)
      
      visitor2.add_preference(:gentle)
      
      visitor3.add_preference(:gentle)
      visitor3.add_preference(:thrilling)
      
      carnival1.add_ride(ride1)
      carnival1.add_ride(ride2)
      carnival1.add_ride(ride3)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)

      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)

      ride3.board_rider(visitor3)

      expect(carnival1.total_revenue).to eq(16)
    end
  end
end