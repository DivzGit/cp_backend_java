package cavinspro.cavins_pro.Controller;

import cavinspro.cavins_pro.Entity.Event;
import cavinspro.cavins_pro.Entity.EventStatusResponse;
import cavinspro.cavins_pro.Repository.EventRepository;
import cavinspro.cavins_pro.Service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/event")
@CrossOrigin
public class EventController {

    @Autowired
    public EventService eventService;

    @Autowired
    private EventRepository eventRepository;
    @GetMapping("/getmsg")
    public String getmsg(){
        return "getmsg";
    }

    @PostMapping(value ="/create" , consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Event> createEvent(@RequestPart Event event ,@RequestPart(name = "file") MultipartFile file){
        System.out.println("createEvent1" );
        Event saveEvent = eventService.createEvent(event,file);
        System.out.println("createEvent1" );
        return ResponseEntity.ok(saveEvent);
    }
    @GetMapping("/getall")
    public  ResponseEntity<List<Event>> getAllEvent(){
        List<Event> Users = eventService.getAllEvent();
        return ResponseEntity.ok(Users);
    }

    @Scheduled(cron = "0 * * * * *") // Executes every second
    public ResponseEntity<EventStatusResponse> scheduledCheckAndUpdateEventStatus() {
        System.out.println("Scheduled task executed at: " + new Date());

        List<Event> updatedEvents = eventService.checkAndUpdateEventStatus();
        List<Event> liveEvents = eventService.livecheckAndUpdateEventStatus();

        // Handle cases where one or both lists are empty
        if ((updatedEvents == null || updatedEvents.isEmpty()) && (liveEvents == null || liveEvents.isEmpty())) {
            return ResponseEntity.noContent().build();
        }

        EventStatusResponse response = new EventStatusResponse(updatedEvents, liveEvents);
        return ResponseEntity.ok(response);
    }}
