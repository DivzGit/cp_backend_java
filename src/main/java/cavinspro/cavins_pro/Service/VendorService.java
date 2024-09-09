package cavinspro.cavins_pro.Service;

import cavinspro.cavins_pro.Entity.Vendor;
import cavinspro.cavins_pro.Repository.VendorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class VendorService {

    @Autowired
    private VendorRepository vendorRepository;
    public Vendor createVendor(Vendor vendor) {
        System.out.println("vendorname++" + vendor.getVendorName() );

        Vendor latestId = vendorRepository.findFirstByOrderByVendorIdDesc();
        String newVendorId;
        System.out.println("vendor latest id----"+latestId.getVendorId());

        if (latestId != null) {
            int latestIdNum = Integer.parseInt(latestId.getVendorId().replace("V", ""));
            newVendorId = "V" + String.format("%04d", latestIdNum + 1);
        } else {
            newVendorId = "V0001";
        }
        vendor.setVendorId(newVendorId);


        return vendorRepository.save(vendor);
    }

    public List<Vendor> getAllVendor() {
        return vendorRepository.findAll();
    }
}
