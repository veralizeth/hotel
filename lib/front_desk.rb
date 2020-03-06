
module Hotel
  class FrontDesk
    attr_reader :rooms, :datarange, :reservations

    def initialize
      @rooms = generate_rooms
      @reservations = []
    end
  
    def generate_rooms
      hotel_rooms = Array.new
        (1..20).each do |room_id|
          hotel_rooms << Room.new(room_id)
      end
      return hotel_rooms
    end

    def room_list
      return @rooms
    end

    def total_reservations
      return @reservations
    end
    # Make reservation method
    def make_resevation(datarange)
      new_reservation = Hotel::Reservation.new(datarange,@rooms[0])
      @reservations << new_reservation
      return new_reservation
    end

    def reservations_by_date(date)
      total_by_date =  @reservations.select do |reservation|
        reservation.start_date == date
      end
      return total_by_date
    end

    def cost_by_reservation(reservation_number)
     cost = nil
     @reservations.each do |reservation|
        cost = reservation.total_cost
      end
      return cost
    end
  end
end