package cavinspro.cavins_pro.Service;


import cavinspro.cavins_pro.Entity.Role;
import cavinspro.cavins_pro.Repository.RoleRepository;
import cavinspro.cavins_pro.exceptions.DuplicateEntryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class RoleService {

    //connect db
    @Autowired
    private RoleRepository roleRepository;

    public Role createRole(Role role) {

        Optional<Role> roleName = roleRepository.findByRoleName(String.valueOf(role.getRoleName()));

        if (roleName.isPresent()) {
            throw new DuplicateEntryException("Role name already created: " + role.getRoleName());
        }
        role.setStatus(1);
        role.setCreatedAt(LocalDateTime.now());
        role.setUpdatedAt(LocalDateTime.now());
        return roleRepository.save(role);
    }

    public Optional<Role> getRoleById (String id) {
        System.out.println(id +"==============");
        System.out.println(roleRepository.findById(id) +"==============");
            Optional<Role> getRole = roleRepository.findById(id);
        return getRole;
    }

    public Role updateRole(String id, Role role) {
        System.out.println(id +"==============" +role );
        Role updateRole =roleRepository.findById(id).orElseThrow();
        System.out.println(updateRole + "=============");
        updateRole.setRoleName(role.getRoleName());
        updateRole.setStatus(role.getStatus());
        updateRole.setCreatedAt(LocalDateTime.now());
        updateRole.setUpdatedAt(LocalDateTime.now());

        return roleRepository.save(updateRole);
    }

    public String  deleteRole(String id) {
        Role deleteRole = roleRepository.findById(id).orElseThrow();
//        deleteRole.setStatus(0);
        deleteRole.setDeleteStatus(1);
        deleteRole.setUpdatedAt(LocalDateTime.now());
        roleRepository.save(deleteRole);
        return "Deleted Successfully..!";
    }

    public List<Role> getallRole() {
        return roleRepository.findByStatus(1);
    }
}
