package cavinspro.cavins_pro.Repository;

import cavinspro.cavins_pro.Entity.Event;
import cavinspro.cavins_pro.Entity.Vendor;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VendorRepository extends MongoRepository<Vendor,String> {



    Vendor findFirstByOrderByVendorIdDesc();

}
