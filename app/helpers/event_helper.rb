module EventHelper
  DAY = 1
  WEEK = 2
  MONTH = 3
  YEAR = 4
  def for_user?(event)
    return true if event.id && Event.find(event).user
    return false
  end
end
