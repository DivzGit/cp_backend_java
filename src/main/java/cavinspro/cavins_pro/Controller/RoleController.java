package cavinspro.cavins_pro.Controller;


import cavinspro.cavins_pro.Entity.Role;
import cavinspro.cavins_pro.Service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/role")
public class RoleController {

    @GetMapping("/getrole_msg")
    public String getmsg(){
        return "getrole msg";
    }

    @Autowired
    public RoleService roleService;
    @PostMapping("/createRole")
    public ResponseEntity<Role> createRole(@RequestBody Role role){
        Role saveRole = roleService.createRole(role);
        return ResponseEntity.ok(saveRole);
    }

    @GetMapping("view/{id}")
    public ResponseEntity<Optional<Role>> getRoleById(@PathVariable("id") String id ){
        Optional<Role> viewRole = roleService.getRoleById(id);
        return ResponseEntity.ok(viewRole);
    }

    @PutMapping("update/{id}")
    public ResponseEntity<Role> updateRole(@PathVariable("id") String id , @RequestBody Role role){
        Role updateRole = roleService.updateRole(id,role);
        return ResponseEntity.ok(updateRole);
    }

    @DeleteMapping("delete/{id}")
    public ResponseEntity<String> deleteRole(@PathVariable("id") String id ){
        String deleteRole = roleService.deleteRole(id);
        return ResponseEntity.ok(deleteRole);
    }

    @GetMapping("getall")
    public ResponseEntity<List<Role>> getallRole(){
       List<Role> getallRoles = roleService.getallRole();
        return ResponseEntity.ok(getallRoles);
    }


}
