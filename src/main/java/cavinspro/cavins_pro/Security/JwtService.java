package cavinspro.cavins_pro.Security;


import cavinspro.cavins_pro.Entity.RefreshToken;
import cavinspro.cavins_pro.Repository.RefreshTokenRepository;
import cavinspro.cavins_pro.Repository.UserRepository;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;

@Component
public class JwtService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RefreshTokenRepository refreshTokenRepository;

    @Autowired
    private JwtBlackListService jwtBlackListService;


    private final String SECRET_KEY = "eyJhbGciOiJIUzI1NiJ9ew0KICAic3ViIjogIjEyMzQ1Njc4OTAiLA0KICAibmFtZSI6ICJBbmlzaCBOYXRoIiwNCiAgImlhdCI6IDE1MTYyMzkwMjINCn0QrIFY4Saw34yvTcfa4DAufNB8o7LLXHq7UD2oIEPns";

    public String generateJwtToken(String userName) {
        System.out.println("emial ===" +userName);
        Map<String, Object> claims = new HashMap<>();
        return createToken(claims, userName,  1000 * 60 * 30);
    }
//    public RefreshToken generateRefreshToken(String userName) {
//        RefreshToken refreshToken = new RefreshToken();
//        Optional<User> getUser = userRepository.findByName(userName);
//        System.out.println("username jwt service___)))"+getUser.get());
//        refreshToken.setUserId(getUser.get());
//        refreshToken.setExpiryDate(Instant.now().plusMillis(600000));
//        System.out.println();
//        refreshToken.setToken(UUID.randomUUID().toString());
//        System.out.println("====refreshToken123123" +refreshToken.getToken());
//        refreshToken =refreshTokenRepository.save(refreshToken);
////        String token = createToken(new HashMap<>(), userName, 1000 * 60 * 60 * 24 * 7); // 7 days
////        RefreshToken refreshToken = new RefreshToken(token, userName, new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 7));
////        refreshTokenRepository.save(refreshToken);
//        System.out.println("======++=++++"+refreshToken);
//        return refreshToken;
//    }

    private String createToken(Map<String, Object> claims, String userName, long expirationTime) {
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(userName)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + expirationTime))
                .signWith(getSignKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    private Key getSignKey() {
        byte[] keys = Decoders.BASE64.decode(SECRET_KEY);
        return Keys.hmacShaKeyFor(keys);
    }

    public String extractUserName(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    public <T> T extractClaim(String token, Function<Claims, T> claimsTFunction) {
         Claims claims = extractAllClaims(token);
        return claimsTFunction.apply(claims);
    }

    private Claims extractAllClaims(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(getSignKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

//    public Boolean validateToken(String token, UserDetails userDetails) {
//        String userName = extractUserName(token);
//        //userName.equals(userDetails.getUsername()) &&
//        return (!isTokenExpired(token));
//
//    }

    public boolean isTokenExpired(String token) {
        Date expirationDate = extractExpiration(token);
        return expirationDate.before(new Date());
    }

    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    public Optional<RefreshToken> findRefreshToken(String token) {
        return refreshTokenRepository.findByToken(token);
    }


    public Boolean validateToken(String token, UserDetails userDetails) {
        String userName = extractUserName(token);
        return (!isTokenExpired(token) && !jwtBlackListService.isBlackListed(token));
    }
//    public void deleteRefreshToken(String userName) {
//        refreshTokenRepository.deleteAllByUserId(userName);
//    }

}
