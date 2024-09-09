package cavinspro.cavins_pro.Entity;

import java.util.List;

public class EventStatusResponse {
    private List<Event> updatedEvents;
    private List<Event> liveEvents;

    public EventStatusResponse(List<Event> updatedEvents, List<Event> liveEvents) {
        this.updatedEvents = updatedEvents;
        this.liveEvents = liveEvents;
    }

    // Getters and setters
    public List<Event> getUpdatedEvents() {
        return updatedEvents;
    }

    public void setUpdatedEvents(List<Event> updatedEvents) {
        this.updatedEvents = updatedEvents;
    }

    public List<Event> getLiveEvents() {
        return liveEvents;
    }

    public void setLiveEvents(List<Event> liveEvents) {
        this.liveEvents = liveEvents;
    }
}
