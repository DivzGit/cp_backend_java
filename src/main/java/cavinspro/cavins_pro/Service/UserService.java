package cavinspro.cavins_pro.Service;

import cavinspro.cavins_pro.Entity.Role;
import cavinspro.cavins_pro.Entity.RoleEnum;
import cavinspro.cavins_pro.Entity.User;
import cavinspro.cavins_pro.Repository.RoleRepository;
import cavinspro.cavins_pro.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User createUser(User user) {
        // Encode the password
        String hashedPassword = passwordEncoder.encode(user.getPassword());

        // Fetch role details if provided
        Role role = null;
        if (user.getRole() != null) {
            // Convert RoleEnum to String if necessary
            String roleName = user.getRole().name();
            role = roleRepository.findByRoleName(roleName)
                    .orElseThrow(() -> new RuntimeException("Role not found"));
        }

        // Create a new User object
        User newUser = new User();
        newUser.setName(user.getName());
        newUser.setPassword(hashedPassword);
        newUser.setEmail(user.getEmail());
        newUser.setEmployeeId(user.getEmployeeId());
        newUser.setPhoneNumber(user.getPhoneNumber());
//        newUser.setRole(role); // Set Role object, not RoleEnum directly
        newUser.setStatus(1);
        newUser.setCreatedAt(LocalDateTime.now());
        newUser.setUpdatedAt(LocalDateTime.now());

        // Save the user
        return userRepository.save(newUser);
    }

    public Optional<User> getUserById(String id) {
        return userRepository.findById(id);
    }

    public User updateUser(String id, User user) {
        Optional<User> getUserOptional = userRepository.findById(id);
        if (getUserOptional.isPresent()) {
            User getUser = getUserOptional.get();
            getUser.setName(user.getName());
            getUser.setEmail(user.getEmail());
            getUser.setPassword(user.getPassword());
            getUser.setEmployeeId(user.getEmployeeId());
            getUser.setPhoneNumber(user.getPhoneNumber());
            // Uncomment and use role setting if necessary
            // getUser.setRole(user.getRole());
            getUser.setUpdatedAt(LocalDateTime.now());
            return userRepository.save(getUser);
        } else {
            return null; // Handle the case where the user is not found
        }
    }

    public String deleteUser(String id) {
        User deleteByUser = userRepository.findById(id).orElseThrow();
        deleteByUser.setStatus(0);
        deleteByUser.setUpdatedAt(LocalDateTime.now());
        userRepository.save(deleteByUser);
        return "Deleted Successfully..!";
    }

    public List<User> getAllUser() {
        return userRepository.findByStatus(1);
    }
}
