class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log,
              :total_rides

  def initialize(data)
    @name = data[:name]
    @min_height = data[:min_height]
    @admission_fee = data[:admission_fee]
    @excitement = data[:excitement]
    @total_revenue = 0
    @rider_log = {}
    @total_rides = 0
  end

  def board_rider(rider)
    if rider.height >= min_height && rider.preferences.include?(excitement) && rider.spending_money >= admission_fee
      if !rider_log.has_key?(rider)
        rider_log[rider] = 1
        rider.spending_money -= admission_fee
        @total_revenue += admission_fee
        @total_rides += 1
      else
        rider_log[rider] += 1
        rider.spending_money -= admission_fee
        @total_revenue += admission_fee
        @total_rides += 1
      end
    end
  end
end