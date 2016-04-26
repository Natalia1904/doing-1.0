package by.burim.doing.dao;

import org.springframework.data.repository.CrudRepository;

import by.burim.doing.entities.Event;

public interface EventsDAO extends CrudRepository<Event, Integer> {
}
