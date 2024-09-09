package cavinspro.cavins_pro.DTO;

import cavinspro.cavins_pro.Entity.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SigninDto {
    private String name;
    private String email;
    private String employeeId;
    private String password;
    private Role role;
}
