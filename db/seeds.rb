require 'open-uri'
[
    { :person_id => "2", :cache_start_time => "2012/07/03:14:00:00", :cache_end_time => "2012/07/03:15:00:00", :title => "First Appt"},
    { :person_id => "5", :cache_start_time => "2012/07/05:11:00:00", :cache_end_time => "2012/07/03:12:00:00", :title => "Second Appt"}
].each do |reservation|
    Reservation.find_or_create_by_person_id(reservation)
end