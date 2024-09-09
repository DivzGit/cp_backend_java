package cavinspro.cavins_pro.Repository;

import cavinspro.cavins_pro.Entity.DocumentMaster;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface DocumentMasterRepository extends MongoRepository<DocumentMaster,String> {



    Optional<DocumentMaster> findByUploadedBy(String userId);
}
