package cavinspro.cavins_pro.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "vendor")
@Data
public class Vendor {

    @Id
    private String id;

    @Field(name = "vendor_name")
    private String vendorName;

    @Field(name = "vendor_id")
    private String vendorId;

}
