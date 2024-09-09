package cavinspro.cavins_pro.Controller;


import cavinspro.cavins_pro.Entity.DocumentMaster;
import cavinspro.cavins_pro.Entity.User;
import cavinspro.cavins_pro.Security.UserDetailsImplements;
import cavinspro.cavins_pro.Service.DocumentMasterService;
import cavinspro.cavins_pro.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/user")
public class UserController {

    @GetMapping("/getmsg")
    public String getmsg(){
        return "getmsg";
    }
    @Autowired
    private UserService userService;

    @Autowired
    private DocumentMasterService documentMasterService;
    @PostMapping("/create")
    public ResponseEntity<User> createUser(@RequestBody User user){

       User saveUser = userService.createUser(user);
        return ResponseEntity.ok(saveUser);
    }

    @GetMapping("view/{id}")
    public ResponseEntity<Optional<User>> getUserById(@PathVariable("id") String id ){
        Optional<User> viewUser = userService.getUserById(id);
        return ResponseEntity.ok(viewUser);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<User> updateUser(@PathVariable("id") String id , @RequestBody User user){
        User UpdateUser = userService.updateUser(id,user);
        return ResponseEntity.ok(UpdateUser);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable("id") String id){
        String DeleteUser = userService.deleteUser(id);
        return ResponseEntity.ok(DeleteUser);
    }

    @GetMapping("/getall")
    public  ResponseEntity<List<User>> getAllUser(){
        List<User> Users = userService.getAllUser();
        return ResponseEntity.ok(Users);
    }

    @PostMapping("/fileUpload")
    public ResponseEntity<List<DocumentMaster>> fileUpload(@RequestPart(name = "file", required = false) MultipartFile file) {
        UserDetailsImplements userDetails = (UserDetailsImplements) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (file == null || file.isEmpty()) {
            System.out.println("File Not Found or Empty");  // For debugging purposes
            return ResponseEntity.badRequest().body(null);  // Handle missing or empty file
        }

        // Process the file
        List<DocumentMaster> savedFiles = documentMasterService.addDocuments(List.of(file), userDetails.getId());
        return ResponseEntity.ok(savedFiles);
    }

}

