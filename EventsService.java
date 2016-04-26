package by.burim.doing.service;

import by.burim.doing.beans.EventBean;
import by.burim.doing.entities.Event;

public interface EventsService {

	void saveEvents(EventBean event);

	Event loadEventsById(Integer eventsId);

	Iterable<Event> loadAllEvents();
}
