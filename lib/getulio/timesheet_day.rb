class Getulio::TimesheetDay
  
  TOTAL_WORKING_TIME_SECODS = 8*60*60 + 48*60
  
  def initialize(date)
    @date = date
  end
  
  def date
    @date
  end
  
  def arrival
    @arrival ||= random_time(7,10)
  end
  
  def begin_of_lunch
    @begin_of_lunch ||= random_time(11,13)
  end
  
  def end_of_lunch
    begin_of_lunch + 60*60
  end
  
  def departure
    remaining_time = TOTAL_WORKING_TIME_SECODS - (begin_of_lunch - arrival)
    end_of_lunch + remaining_time
  end
  
  private
  
  def random_time(from,to)
    hour = rand(from..(to-1))
    minutes = rand(0..59)
    Time.new(@date.year, @date.month, @date.day, hour, minutes)
  end
  
end