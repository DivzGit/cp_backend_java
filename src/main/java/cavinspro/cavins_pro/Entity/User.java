package cavinspro.cavins_pro.Entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.time.LocalDateTime;
import java.util.List;

@Document(collection = "user")
@Data
public class User {

@Id
private String id;

private String name;

private String employeeId;

private String email;

private String password;

private Long phoneNumber;

    private RoleEnum role; // Changed from String to RoleEnum

//    @Transient
//    private List<Role> roleDetails;
//private String organizationId;
//
//private List<String> roleSet;
//
//private List<String> organizationSet;

private int status;

private LocalDateTime createdAt;

private LocalDateTime updatedAt;
@Field(name = "vendor_id")
private String vendorId;
//@Field(name = "vendor_id")
//private List<String> vendorId;
}
