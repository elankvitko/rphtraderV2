module AvailabilityHelper
  def get_start_date
    params.fetch( :start_date, Date.today ).to_date
  end

  def get_date_range
    start_date = get_start_date
    ( start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week ).to_a
  end

  def previous_month
    get_date_range.first - 1
  end

  def next_month
    get_date_range.last + 1
  end

  def find_month
    get_start_date.month
  end

  def find_year
    get_start_date.year
  end

  def diem_events( day )
    current_user.diems.select { |event| event.start_time.to_date == day }.length
  end
end
