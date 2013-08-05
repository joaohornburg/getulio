require 'spec_helper'
require 'getulio/timesheet_day'

describe Getulio::TimesheetDay do

  def timesheet_day
    Getulio::TimesheetDay.new(Date.parse("2013-08-04"))
  end

  it "has a date" do
    timesheet_day.date.should eq Date.parse("2013-08-04")
  end

  describe "#arrival" do

    it "is a Time" do
      timesheet_day.arrival.should be_a Time
    end

    it "is between 7:00 and 10:00" do
      timesheet_day.arrival.hour.should >= 7
      timesheet_day.arrival.hour.should < 10
    end

    it "creates default random arrivals" do
      first_arrival = timesheet_day.arrival
      second_arrival = timesheet_day.arrival
      third_arrival = timesheet_day.arrival
      first_arrival.should_not eq second_arrival
      first_arrival.should_not eq third_arrival
      second_arrival.should_not eq first_arrival
      second_arrival.should_not eq third_arrival
    end

    it "is calculated only once per instance" do
      tmsd = timesheet_day
      arrival = tmsd.arrival
      5.times do tmsd.arrival.should eq arrival end
    end

  end

  describe "#begin_of_lunch" do

    it "is a Time" do
      timesheet_day.begin_of_lunch.should be_a Time
    end

    it "is between 11:00 and 13:00" do
      timesheet_day.begin_of_lunch.hour.should >= 11
      timesheet_day.begin_of_lunch.hour.should < 13
    end

    it "creates default random begin_of_lunchs" do
      first_begin_of_lunch = timesheet_day.begin_of_lunch
      second_begin_of_lunch = timesheet_day.begin_of_lunch
      third_begin_of_lunch = timesheet_day.begin_of_lunch
      first_begin_of_lunch.should_not eq second_begin_of_lunch
      first_begin_of_lunch.should_not eq third_begin_of_lunch
      second_begin_of_lunch.should_not eq first_begin_of_lunch
      second_begin_of_lunch.should_not eq third_begin_of_lunch
    end

    it "is calculated only once per instance" do
      tmsd = timesheet_day
      begin_of_lunch = tmsd.begin_of_lunch
      5.times do tmsd.begin_of_lunch.should eq begin_of_lunch end
    end

  end

  describe "#end_of_lunch" do

    it "is a Time" do
      timesheet_day.begin_of_lunch.should be_a Time
    end

    it "is 1 hour after begin_of_lunch" do
      Getulio::TimesheetDay.any_instance.stub(:begin_of_lunch).and_return(Time.local(2013,12,02,11,45))
      timesheet_day.end_of_lunch.should eq Time.local(2013,12,02,12,45)
    end
  end

  describe "#departure" do

    it "is a Time" do
      timesheet_day.departure.should be_a Time
    end

    it "completes 8:48 of work for the given day" do
      Getulio::TimesheetDay.any_instance.stub(:arrival).and_return(Time.local(2013,12,02,9,00))
      Getulio::TimesheetDay.any_instance.stub(:begin_of_lunch).and_return(Time.local(2013,12,02,12,00))
      timesheet_day.departure.should eq Time.local(2013,12,02,18,48)
    end
  end

end
