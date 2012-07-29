module EventHelper
  def for_user?(event)
    return false if event.nil?
    return true if Event.find(event).user
    return false
  end
end
