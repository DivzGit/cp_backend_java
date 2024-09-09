package cavinspro.cavins_pro.Security;


import cavinspro.cavins_pro.Entity.RefreshToken;
import cavinspro.cavins_pro.Entity.User;
import cavinspro.cavins_pro.Repository.RefreshTokenRepository;
import cavinspro.cavins_pro.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class RefreshTokenService {

    @Autowired
    private RefreshTokenRepository refreshTokenRepository;

    @Autowired
    private UserRepository userRepository;


    public Optional<RefreshToken> findByToken(String refreshToken) {
        System.out.println("find == " +refreshToken);
        return refreshTokenRepository.findByToken(refreshToken);
    }

    public RefreshToken verifyExpiration(RefreshToken token) {
        System.out.println("token --"+token);
        LocalDateTime expiryDate = token.getExpiryDate();
        LocalDateTime now = LocalDateTime.now();
        System.out.println("expiry -- " +expiryDate);
        if (expiryDate.isBefore(now)) {
            refreshTokenRepository.delete(token);
            throw new RuntimeException("Refresh token was expired with this ID " + token.getToken() + " , Please make a new signin request");
        }

        return token;
    }

    public RefreshToken createRefreshToken(String userId) {
        RefreshToken refreshToken = new RefreshToken();
        Optional<User> getUserId = userRepository.findById(userId);

        if (getUserId.isPresent()) {
            refreshToken.setUserId(getUserId.get());

            // Use ZonedDateTime to handle time zone correctly
            ZonedDateTime now = ZonedDateTime.now(ZoneId.of("Asia/Kolkata"));
            ZonedDateTime expiryDateTime = now.plusMinutes(86400000);
            LocalDateTime expiryDate = expiryDateTime.toLocalDateTime();

            refreshToken.setExpiryDate(expiryDate);
            refreshToken.setToken(UUID.randomUUID().toString());
            refreshToken = refreshTokenRepository.save(refreshToken);

            // Print the expiry date and time for verification
            System.out.println("Expiry Date: " + expiryDateTime);
        } else {
            // Handle the case where the user is not found, if necessary
        }

        return refreshToken;
    }

    public List<RefreshToken> getAlltoken() {
        return refreshTokenRepository.findAll();
    }
//    public List<User> getAllUser() {
//        return userRepository.findByStatus(1);
//    }
}
