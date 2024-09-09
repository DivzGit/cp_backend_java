package cavinspro.cavins_pro.DTO;

import cavinspro.cavins_pro.Entity.Role;
import cavinspro.cavins_pro.Entity.RoleEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JwtResponse {

    private String id;
    private String name;
    private String email;
    private String password;
    private String employeeId;
    private Long phoneNumber;
//    private String roleId;
    private int status;
    private String roleName;
    private String token;
    private String refreshToken;

    public JwtResponse(String id, String username, String password, String email, String employeeId, Long phoneNumber,  int status, String jwtToken, String refreshToken) {

        this.id = id;
        this.name = username;
        this.email = email;
        this.employeeId=employeeId;
        this.password = password;
        this.phoneNumber=phoneNumber;
//        this.roleId=roleId;
//        this.organizationId=organizationId;
//        this.roleSet=roleSet;
//        this.organizationSet=organizationSet;
        this.status=status;
        this.token = jwtToken;
        this.refreshToken = refreshToken;
    }



}
