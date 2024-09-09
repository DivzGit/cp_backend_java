package cavinspro.cavins_pro.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.annotation.Collation;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "document_master")
public class DocumentMaster {

@Id
private String id;
private String documentName;
private String documentPath;
private String documentFor;
private String documentModel;
private String uploadedBy;
private LocalDateTime createdAt;
private LocalDateTime updatedAt;
}
