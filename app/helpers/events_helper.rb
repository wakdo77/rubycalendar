module EventsHelper
  def linktoevents(date)
    # ev = Event.find(event_date: '2019-02-18')
    ev = Event.where("event_date = ?", date)
    tagtext = ev.size > 0 ? "#{ev.size} events" : "no events"
    @content = ev.size > 0 ? link_to(tagtext, controller: 'events', action: 'index', params: {date: date}) : tagtext
  end
end
