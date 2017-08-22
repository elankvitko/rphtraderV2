class AvailabilityController < ApplicationController
  def index
    @diems = current_user.diems
  end

  def manipulate
    if request.xhr?
      if params[ :availability ].to_date
        param_date = params[ :availability ].to_date
        events = current_user.diems.select { |event| event.start_time.to_date == param_date }

        if events.length == 0
          Diem.create( name: "available", start_time: param_date, user_id: current_user.id )
        else
          events[ 0 ].destroy
        end
      end
    end
  end
end
