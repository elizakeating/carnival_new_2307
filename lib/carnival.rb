class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    ranked_rides = @rides.sort_by do |ride|
      ride.total_rides
    end

    ranked_rides.last
  end

  def most_profitable_ride
    ranked_rides = @rides.sort_by do |ride|
      ride.total_revenue
    end

    ranked_rides.last
  end

  def total_revenue
    total_revenue = 0
    @rides.each do |ride|
      total_revenue += ride.total_revenue
    end

    total_revenue
  end
end