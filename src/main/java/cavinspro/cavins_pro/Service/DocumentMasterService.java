package cavinspro.cavins_pro.Service;

import cavinspro.cavins_pro.Entity.DocumentCategories;
import cavinspro.cavins_pro.Entity.DocumentMaster;
import cavinspro.cavins_pro.Repository.DocumentCategoriesRepository;
import cavinspro.cavins_pro.Repository.DocumentMasterRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

@Slf4j
@Service

public class DocumentMasterService {
    @Autowired
    private DocumentCategoriesRepository documentCategoriesRepository;

    @Autowired
    private DocumentMasterRepository documentMasterRepository;

    public List<DocumentMaster> addDocuments(List<MultipartFile> files, String userId) {
        List<DocumentMaster> documents = new ArrayList<>();

        if (Objects.nonNull(files) && !files.isEmpty()) {
            for (MultipartFile file : files) {
                String originalFileName = file.getOriginalFilename();
                String documentName = file.getName();

                // Log or print for debugging
                System.out.println("Processing file: " + originalFileName);

                Optional<DocumentCategories> documentCategories = documentCategoriesRepository.findByName(documentName);
                System.out.println("category ----"+documentCategories);
                if (documentCategories.isPresent()) {
                    DocumentMaster fileUpload = documentMasterRepository.findByUploadedBy(userId).orElse(new DocumentMaster());

                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                    String formattedDate = dateFormat.format(new Date());
                    String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                    String fileName = formattedDate + '_' + UUID.randomUUID().toString() + '_' + originalFileName;

                    fileUpload.setDocumentFor(documentCategories.get().getId());
                    fileUpload.setDocumentName(fileName);
                    fileUpload.setCreatedAt(LocalDateTime.now());
                    fileUpload.setUpdatedAt(LocalDateTime.now());
                    fileUpload.setUploadedBy(userId);
                    fileUpload.setDocumentPath("uploads" + "/" + userId  + "/" + fileName);
                    documents.add(documentMasterRepository.save(fileUpload));

                    try {
                        String savedFileName = "uploads" + File.separator + userId;
                        Path uploadPath = Paths.get(savedFileName);
                        if (!Files.exists(uploadPath)) {
                            Files.createDirectories(uploadPath);
                        }

                        Path filePath = uploadPath.resolve(fileName);
                        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                    } catch (IOException e) {
                        e.printStackTrace(); // Consider logging this in production
                    }

                } else {
                    // Log or print for missing categories
                    System.out.println("Document category not found for file: " + originalFileName);
                }
            }
        } else {
            System.out.println("File is Empty");
        }

        return documents;
    }
}
