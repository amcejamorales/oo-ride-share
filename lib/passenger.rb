require 'pry'

module RideShare
  class Passenger
    attr_reader :id, :name, :phone_number, :trips

    def initialize(input)
      if input[:id] == nil || input[:id] <= 0
        raise ArgumentError.new("ID cannot be blank or less than zero.")
      end

      @id = input[:id]
      @name = input[:name]
      @phone_number = input[:phone]
      @trips = input[:trips] == nil ? [] : input[:trips]
    end

    def get_drivers
      @trips.map{ |t| t.driver }
    end

    def add_trip(trip)
      @trips << trip
    end

    def total_money_spent
      total_money_spent = 0
      @trips.each do |trip|
        if trip.cost.nil?
        else
          total_money_spent += trip.cost
        end

      end
      return total_money_spent
    end

    def total_time_spent
      total_time_spent = 0.0
      @trips.each do |trip|
        if trip.end_time.nil?
        else
          total_time_spent += trip.duration
        end
      end
      return total_time_spent
    end

  end
end
