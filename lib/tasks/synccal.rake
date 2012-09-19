def create_new_ews_reservation(item, calendar)
  resource_calendar = Resource.find(:all)
  resource_calendar.each do |c|
      calendar = c.exchange_calendar_id
      cal_local = c.id
      cal  = Viewpoint::EWS::CalendarFolder.get_folder(calendar)
      #loop through reservations and add new
        reservations = Reservation.where(:exchange_event_id => nil, :resource_id => cal_local)
          reservations.each do |r|
              item = {:subject => {:text => r.title},
                      :start => {:text => (r.cache_start_time.strftime "%Y-%m-%dT%H:%M:%S")},
                      :end => {:text => (r.cache_end_time.strftime "%Y-%m-%dT%H:%M:%S") }
                    }
                    resp = conn.ews.create_calendar_item(:calendar, item)
                    #bring back the exchange_event_id so we're sync'd
                    if(resp.status == 'Success')
                        resp = resp.items.shift
                        r.attributes = {
                            :exchange_event_id => resp[:calendar_item][:item_id][:id],
                            :exchange_change_key => resp[:calendar_item][:item_id][:change_key] 
                        }
                        r.save
                    else
                   #todo -- logger.info or logger.warn for logging of errors
                   raise EwsError, "Could not create CalendarItem. #{resp.code}: #{resp.message}"
                  end
         end
      end
end
        
       
        
  

task :add_calendar_event => :environment do
  ews_settings = YAML.load_file("#{Rails.root.to_s}/config/dss-rm.yml")['dssrm']
      
  Viewpoint::EWS::EWS.endpoint = ews_settings["endpoint"]
  Viewpoint::EWS::EWS.set_auth(ews_settings["username"], ews_settings["password"])
  conn = Viewpoint::EWS::EWS.instance
  cal  = Viewpoint::EWS::CalendarFolder.get_folder(:calendar)
  resp = conn.ews.create_calendar_item(:calendar, item)
  newreservation = Reservation.where(:all)
end    