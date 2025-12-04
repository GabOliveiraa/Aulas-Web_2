package br.edu.ifspcjo.ads.web2.tkd.model;

import java.util.List;
import java.util.Map;

public class MonthEvents {

	private String label;
	private List<Event> events;
	private Map<Integer, List<Event>> eventsByDay;

	public MonthEvents(String label, List<Event> events, Map<Integer, List<Event>> eventsByDay) {
		this.label = label;
		this.events = events;
		this.eventsByDay = eventsByDay;
	}

	public String getLabel() {
		return label;
	}

	public List<Event> getEvents() {
		return events;
	}

	public Map<Integer, List<Event>> getEventsByDay() {
		return eventsByDay;
	}
}
