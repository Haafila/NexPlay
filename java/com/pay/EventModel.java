package com.pay;

public class EventModel {
	private int event_id;	
	private String eventName;
    private String eventDate;
    private String eventTime;
    private String description;
    private String venue;
    private String aditional;

	public EventModel() {
		// TODO Auto-generated constructor stub
	}

	public EventModel(int event_id, String eventName, String eventDate, String eventTime, String description, String venue, String aditional) {
		super();
		this.event_id = event_id;
		this.eventName = eventName;
		this.eventDate = eventDate;
		this.eventTime = eventTime;
		this.description = description;
		this.venue = venue;
		this.aditional = aditional;
	}
	

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getEventName() {
		return eventName;
	}

	public String getDescription() {
		return description;
	}

	public String getVenue() {
		return venue;
	}

	public String getAditional() {
		return aditional;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public void setAditional(String aditional) {
		this.aditional = aditional;
	}

	public String getEventDate() {
		return eventDate;
	}

	public String getEventTime() {
		return eventTime;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}
	
	
	
}
