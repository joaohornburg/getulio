require 'getulio/timesheet_day'

class Getulio::Timesheet
  
  def self.for_current_month
    Getulio::Timesheet.new
  end
  
  def initialize
    initialize_days
  end
  
  def days
    @days
  end
  
  
  private
  
  def initialize_days
    @days = []
    date = beginning_of_month
    days_until_today.times do
      @days << Getulio::TimesheetDay.new(date)
      date = date.next
    end
  end
  
  def days_until_today
    (Date.today - beginning_of_month).numerator + 1
  end
  
  def beginning_of_month
    Date.parse(Time.now.strftime("%Y-%m-01"))
  end
end