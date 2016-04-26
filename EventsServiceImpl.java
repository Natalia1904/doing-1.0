package by.burim.doing.service.impl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import by.burim.doing.beans.EventBean;
import by.burim.doing.dao.EventsDAO;
import by.burim.doing.entities.Event;
import by.burim.doing.service.EventsService;
import by.burim.doing.service.utils.DateUtils;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class EventsServiceImpl implements EventsService {

	@Autowired
	private EventsDAO dao;

	@Override
	public void saveEvents(EventBean event) {
		Event entity = new Event();
		
		Date sqlDate = DateUtils.toSqlDate(event.getDate());
		
		entity.setTitle(event.getName());
		entity.setStartDate(sqlDate);
		//entity.setDescription(event.getDescription());

		dao.save(entity);
	}

	@Override
	public Iterable<Event> loadAllEvents(){
		return dao.findAll();
	}

	@Override
	public Event loadEventsById(Integer eventsId){
		return dao.findOne(eventsId);
	}
}
