class Event < ActiveRecord::Base
  belongs_to :user
  has_event_calendar
  attr_accessible :name, :start_at, :end_at, :user, :repeat
  #repeat every_day: 1, every_week: 2, every_month: 3, every_year: 4

end
