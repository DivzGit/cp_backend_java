package cavinspro.cavins_pro.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Document(collection = "refreshTokens")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RefreshToken {

    @Id
    private String id;
    private String token;
    private User userId;
    private LocalDateTime expiryDate;

}
