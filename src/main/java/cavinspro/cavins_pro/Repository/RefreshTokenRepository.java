package cavinspro.cavins_pro.Repository;


import cavinspro.cavins_pro.Entity.RefreshToken;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RefreshTokenRepository extends MongoRepository<RefreshToken, String> {

    Optional<RefreshToken> findByToken(String token);

    Optional<RefreshToken> deleteByToken(String token);


//    void deleteAllByUserId(String userName);


//    void delete(String token);
}
