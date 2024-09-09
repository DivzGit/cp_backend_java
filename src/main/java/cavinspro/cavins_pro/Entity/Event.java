package cavinspro.cavins_pro.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "event")
public class Event {
    @Id
    private String id;
    @Field(name = "product_name")
    private String productName;
    private String file;
    @Field(name = "start_time")
    private LocalDateTime startTime;
    @Field(name = "event_id")
    private String eventId;
    @Field(name = "end_time")
    private LocalDateTime endTime;
    private int status;

    @CreatedDate
    @Field(name = "created_at")
    private LocalDateTime createdAt;

    @LastModifiedBy
    @Field(name = "updated_at")
    private LocalDateTime updatedAt;

    @Field(name = "vendor_id")
    private List<String> vendorId;
}
