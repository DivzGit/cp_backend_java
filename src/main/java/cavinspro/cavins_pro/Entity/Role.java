package cavinspro.cavins_pro.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Document(collection = "role")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {

@Id
private String id;
//    @Enumerated(EnumType.STRING)
    private RoleEnum roleName;
    private int status;
private int deleteStatus;
private LocalDateTime createdAt;
private LocalDateTime updatedAt;

}
