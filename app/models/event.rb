class Event < ActiveRecord::Base
  belongs_to :user
  has_event_calendar
  attr_accessible :name, :start_at, :end_at, :user, :repeat
  validates_presence_of :name, :start_at, :end_at
  #repeat every_day: 1, every_week: 2, every_month: 3, every_year: 4
  def repeat=(period)
    case period
    when 'day'
      self[:repeat] = EventHelper::DAY
    when 'week'
      self[:repeat] = EventHelper::WEEK
    when 'month' 
      self[:repeat] = EventHelper::MONTH
    when 'year' 
      self[:repeat] = EventHelper::YEAR
    end
  end
end
