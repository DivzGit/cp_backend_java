package cavinspro.cavins_pro.Security;

import cavinspro.cavins_pro.Entity.Role;
import cavinspro.cavins_pro.Entity.RoleEnum;
import cavinspro.cavins_pro.Entity.User;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Data
public class UserDetailsImplements implements UserDetails {
    private String id;
    private String name;
    private String employeeId;
    private String email;
    private String password;
    private Long phoneNumber;
    private RoleEnum role;
//    private String organizationId;
//    private List<String> roleSet;
//    private List<String> organizationSet;
    private int status;
    private List<GrantedAuthority> authorities;


    public UserDetailsImplements (User user){
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.password = user.getPassword();
        this.phoneNumber=user.getPhoneNumber();
        this.role = user.getRole() != null ? user.getRole() : RoleEnum.USER; // Handle null role

//        this.role = user.getRole();
//        this.organizationId=user.getOrganizationId();
//        this.roleSet=user.getRoleSet();
//        this.organizationSet=user.getOrganizationSet();
        this.status=user.getStatus();
        this.authorities = List.of(new SimpleGrantedAuthority(role.name()));



//        this.authorities = Arrays.stream(user.getRoleId().split(","))
////                .map(SimpleGrantedAuthority::new)
//                .map(SimpleGrantedAuthority::new)
//                .collect(Collectors.toList());

    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }


}
