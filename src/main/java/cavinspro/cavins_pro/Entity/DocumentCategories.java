package cavinspro.cavins_pro.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "document_categories")
public class DocumentCategories {
    @Id
    private String id ;
    private String name;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
