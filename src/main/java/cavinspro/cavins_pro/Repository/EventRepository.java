package cavinspro.cavins_pro.Repository;

import cavinspro.cavins_pro.Entity.Event;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EventRepository extends MongoRepository<Event,String> {

    List<Event> findByStatus(int i);

    Event findFirstByOrderByEventIdDesc();
}
