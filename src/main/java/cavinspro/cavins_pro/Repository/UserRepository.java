package cavinspro.cavins_pro.Repository;


import cavinspro.cavins_pro.Entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends MongoRepository<User, String> {
    List<User> findByStatus(Integer Status);
//    @Query("{'$or' : [{'email' : ?0}, {'employeeId' : ?0}]}")
    Optional<User> findByName(String name);
    @Query("{'$or' : [{'email' : ?0}, {'employeeId' : ?0}]}")
    Optional<User> findByEmailOrEmployeeId(String emailOrEmployeeId);

}
