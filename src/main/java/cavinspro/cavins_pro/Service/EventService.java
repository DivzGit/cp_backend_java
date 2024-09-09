package cavinspro.cavins_pro.Service;

import cavinspro.cavins_pro.Entity.Event;
import cavinspro.cavins_pro.Entity.Role;
import cavinspro.cavins_pro.Entity.User;
import cavinspro.cavins_pro.Entity.Vendor;
import cavinspro.cavins_pro.Repository.DocumentMasterRepository;
import cavinspro.cavins_pro.Repository.EventRepository;
import cavinspro.cavins_pro.Repository.VendorRepository;
import cavinspro.cavins_pro.Security.UserDetailsImplements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Service
public class EventService {
    @Autowired
    public EventRepository eventRepository;
    @Autowired
    public DocumentMasterService documentMasterService;

    @Autowired
    private VendorRepository vendorRepository;

    public Event createEvent(Event event,MultipartFile file) {
        System.out.println("createEventService");
        event.setStatus(0);
        event.setCreatedAt(LocalDateTime.now());
        event.setUpdatedAt(LocalDateTime.now());
        UserDetailsImplements userDetails = (UserDetailsImplements) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        event.setFile(documentMasterService.addDocuments(List.of(file), userDetails.getId()).get(0).getDocumentPath());

//        event id create start
        Event latestId = eventRepository.findFirstByOrderByEventIdDesc();
        String newTicketId;

        if (latestId != null) {
            int latestIdNum = Integer.parseInt(latestId.getEventId().replace("E", ""));
            newTicketId = "E" + String.format("%04d", latestIdNum + 1);
        } else {
            newTicketId = "E0001";
        }
        event.setEventId(newTicketId);
        //        event id create end
        return eventRepository.save(event);
    }

    public List<Event> getAllEvent() {

//        return eventRepository.findAll();
        return eventRepository.findAll();

    }

    public List<Event> getEventsByStatus(int i) {
        return null;
    }

    public void updateEventStatus(String id, int i) {
        return ;
    }


    public List<Event> checkAndUpdateEventStatus() {
        // Fetch events with status 0
        List<Event> events = eventRepository.findByStatus(0);

        if (events == null || events.isEmpty()) {
            System.out.println("No events found with status 0.");
            return null;
        }

        // Get the current time
        Date date = new Date();

        LocalDateTime localDateTime = date.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();

        // Define the desired format
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

        // Format LocalDateTime to the desired format
        String formattedDate = localDateTime.format(formatter);

        // Print the formatted date
        System.out.println("Formatted date : " + formattedDate);

        for (Event event : events) {
            System.out.println("Event start time : " + event.getStartTime());
            // Check if the event start time is equal to the current time
            if (event.getStartTime().toString().equals(formattedDate)) {
                // Update the event status to 1
                System.out.println("Event ID : " + event.getEventId());
                event.setStatus(1);
                event.setUpdatedAt(LocalDateTime.now());
                eventRepository.save(event);
                System.out.println("Event updated : " + event);
                System.out.println("Event ID " + event.getEventId() + " status updated to 1.");
            }
        }

        return events;
    }

    public List<Event> livecheckAndUpdateEventStatus() {
            // Fetch events with status 0
            List<Event> liveevents = eventRepository.findByStatus(1);

            if (liveevents == null || liveevents.isEmpty()) {
                System.out.println("No events found with status 1.");
                return null;
            }

            // Get the current time
            Date date = new Date();

            LocalDateTime localDateTime = date.toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDateTime();

            // Define the desired format
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

            // Format LocalDateTime to the desired format
            String formattedDate = localDateTime.format(formatter);

            // Print the formatted date
            System.out.println("Formatted date : " + formattedDate);

            for (Event liveevent : liveevents) {
                System.out.println("Event End time : " + liveevent.getEndTime());
                // Check if the event start time is equal to the current time
                if (liveevent.getEndTime().toString().equals(formattedDate)) {
                    // Update the event status to 1
                    System.out.println("Event ID : " + liveevent.getEventId());
                    liveevent.setStatus(2);
                    liveevent.setUpdatedAt(LocalDateTime.now());
                    eventRepository.save(liveevent);
                    System.out.println("Event updated : " + liveevent);
                    System.out.println("Event ID " + liveevent.getEventId() + " status updated to 2.");
                }
            }

            return liveevents;
        }

    }
