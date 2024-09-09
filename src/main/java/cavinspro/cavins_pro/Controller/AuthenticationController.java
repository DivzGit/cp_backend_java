package cavinspro.cavins_pro.Controller;

import cavinspro.cavins_pro.DTO.JwtResponse;
import cavinspro.cavins_pro.DTO.RefreshTokenRequest;
import cavinspro.cavins_pro.DTO.RefreshTokenResponse;
import cavinspro.cavins_pro.DTO.SigninDto;
import cavinspro.cavins_pro.Entity.RefreshToken;
import cavinspro.cavins_pro.Repository.RefreshTokenRepository;
import cavinspro.cavins_pro.Security.JwtBlackListService;
import cavinspro.cavins_pro.Security.JwtService;
import cavinspro.cavins_pro.Security.RefreshTokenService;
import cavinspro.cavins_pro.Security.UserDetailsImplements;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*", maxAge = 3600)
@RequestMapping("/auth")
@Slf4j
public class AuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtBlackListService jwtBlackListService;

    @Autowired
    private RefreshTokenRepository refreshTokenRepository;

    @Autowired
    private RefreshTokenService refreshTokenService;
    @PostMapping("/signin")
    public ResponseEntity<?> authenticateAndGetToken(@RequestBody SigninDto signinDto) {
        try {
            String nameOrEmail = signinDto.getName() != null ? signinDto.getName() :
                    signinDto.getEmail() != null ? signinDto.getEmail().toLowerCase() : signinDto.getEmployeeId();

            Authentication authenticate = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(nameOrEmail, signinDto.getPassword()));

            if (authenticate.isAuthenticated()) {
                SecurityContextHolder.getContext().setAuthentication(authenticate);
                UserDetailsImplements userDetails = (UserDetailsImplements) authenticate.getPrincipal();
                String jwtToken = jwtService.generateJwtToken(userDetails.getEmail());
                RefreshToken refreshToken = refreshTokenService.createRefreshToken(userDetails.getId());
                return ResponseEntity.ok()
                        .body(new JwtResponse(
                                userDetails.getId(),
                                userDetails.getUsername(),
                                userDetails.getPassword(),
                                userDetails.getEmail(),
                                userDetails.getEmployeeId(),
                                userDetails.getPhoneNumber(),
                                userDetails.getStatus(),
                                jwtToken,
                                refreshToken.getToken()
                        ));
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
            }
        } catch (Exception e) {
            log.warn(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred");
        }
    }
    @PostMapping("/refresh_token")
    public ResponseEntity<?> refreshToken(@RequestBody RefreshTokenRequest refreshTokenRequest){
        System.out.println("refreshtoken request --" + refreshTokenRequest);
        String refreshToken = refreshTokenRequest.getRefreshToken();
        System.out.println("refres == "+refreshToken);
        return refreshTokenService.findByToken(refreshToken)
                .map(refreshTokenService::verifyExpiration)
                .map(RefreshToken::getUserId)
                .map(user -> {
                    String token = jwtService.generateJwtToken(user.getEmail());
                    System.out.println("token=== "+token);
                    return ResponseEntity.ok(new RefreshTokenResponse(
                                    refreshToken,
                                    token
                            )
                    );
                })
                .orElseThrow(() -> new RuntimeException("Refresh token is not in database!.."+refreshToken));
    }
    @GetMapping("/getall_refresh_token")
    public  ResponseEntity<List<RefreshToken>> getAlltoken(){
        List<RefreshToken> refreshTokens = refreshTokenService.getAlltoken();
        return ResponseEntity.ok(refreshTokens);
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(@RequestHeader(name= "Authorization") String token) {
        if (token != null && token.startsWith("Bearer ")) {
            String jwt = token.substring(7);
            jwtBlackListService.addToBlackList(jwt);

            // Invalidate refresh token
            String username = jwtService.extractUserName(jwt);
//            jwtService.deleteRefreshToken(username);
        }
        return ResponseEntity.ok("Logged out successfully");
    }

}
