package cavinspro.cavins_pro.Repository;


import cavinspro.cavins_pro.Entity.Role;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RoleRepository extends MongoRepository<Role, String> {
    boolean existsByRoleName(String roleName);
//    Optional<Role> findByRoleName(String roleName);

    Optional<Role> findById(String id);

    Optional<Role> findByRoleName(String roleName); // Adjust method name to match field

//    List<Role> findByStatus(int i);
    List<Role> findByStatus(Integer status);

    List<Role> findBydeleteStatus(Integer deleteStatus);

}

