package cavinspro.cavins_pro.Security;


import cavinspro.cavins_pro.Entity.User;
import cavinspro.cavins_pro.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class UserDetailsServiceImplements implements UserDetailsService {
    @Autowired
    public UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String nameOrEmail) throws UsernameNotFoundException {
        System.out.println("===========1111"+nameOrEmail);
        Optional<User> userInfo  = userRepository.findByEmailOrEmployeeId(
                nameOrEmail);
        System.out.println("++++++++++++ userRepo--"+userInfo);
        return userInfo.map(UserDetailsImplements::new).orElseThrow(() -> new UsernameNotFoundException("User Name Not Found : " + nameOrEmail));
    }
}
