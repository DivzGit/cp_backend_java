package cavinspro.cavins_pro.Repository;

import cavinspro.cavins_pro.Entity.DocumentCategories;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DocumentCategoriesRepository extends MongoRepository<DocumentCategories, String> {

    Optional<DocumentCategories> findByName(String documentName);
}
