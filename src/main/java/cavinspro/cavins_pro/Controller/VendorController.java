package cavinspro.cavins_pro.Controller;

import cavinspro.cavins_pro.Entity.Event;
import cavinspro.cavins_pro.Entity.User;
import cavinspro.cavins_pro.Entity.Vendor;
import cavinspro.cavins_pro.Repository.VendorRepository;
import cavinspro.cavins_pro.Service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/vendor")
@CrossOrigin
public class VendorController {

    @Autowired
    private VendorService vendorService;
    @Autowired
    private VendorRepository vendorRepository;
    @GetMapping("/getmsg")
    public String getmsg(){
        return "getmsg";
    }

    @PostMapping("/create")
    public ResponseEntity<Vendor> createVendor(@RequestBody Vendor vendor){
        System.out.println("printvendor++++++++" +vendor);
        Vendor saveVendor = vendorService.createVendor(vendor);
        return ResponseEntity.ok(saveVendor);
    }
    @GetMapping("/getall")
    public  ResponseEntity<List<Vendor>> getAllVendor(){
        List<Vendor> vendors = vendorService.getAllVendor();
        return ResponseEntity.ok(vendors);
    }


}
