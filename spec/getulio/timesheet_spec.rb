require 'spec_helper'
require 'getulio/timesheet'

describe Getulio::Timesheet do
  
  describe ".for_current_month" do
    
    def collection_items_should_be_a(collection,type)
      collection.each do |item|
        item.should be_a type
      end
    end
    
    it "returns a Timesheet" do
      Getulio::Timesheet.for_current_month.should be_a Getulio::Timesheet
    end
    
    it "has TimesheetDays for every day from the begining of the month until now" do
      Delorean.time_travel_to(Time.parse('2013-08-04'))
      Getulio::Timesheet.for_current_month.days.length.should eq 4
      Getulio::Timesheet.for_current_month.days[0].date.should eq Date.parse('2013-08-01')
      Getulio::Timesheet.for_current_month.days[1].date.should eq Date.parse('2013-08-02')
      Getulio::Timesheet.for_current_month.days[2].date.should eq Date.parse('2013-08-03')
      Getulio::Timesheet.for_current_month.days[3].date.should eq Date.parse('2013-08-04')
      collection_items_should_be_a(Getulio::Timesheet.for_current_month.days,Getulio::TimesheetDay)
      Delorean.time_travel_to(Time.parse('2013-07-30'))
      Getulio::Timesheet.for_current_month.days.length.should eq 30
      collection_items_should_be_a(Getulio::Timesheet.for_current_month.days,Getulio::TimesheetDay)
      Delorean.back_to_the_present
    end
    
  end
  
end