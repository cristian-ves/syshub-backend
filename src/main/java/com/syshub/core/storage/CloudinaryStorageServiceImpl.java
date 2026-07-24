package com.syshub.core.storage;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.util.Map;

@Service
@Primary
@RequiredArgsConstructor
public class CloudinaryStorageServiceImpl implements IStorageService {

    private final Cloudinary cloudinary;

    @Override
    public String store(MultipartFile file) {
        try {
            if (file.isEmpty()) {
                throw new RuntimeException("Failed to save an empty file.");
            }

            String contentType = file.getContentType();
            String resourceType = determineResourceType(contentType, file.getOriginalFilename());

            Map uploadResult = cloudinary.uploader().upload(file.getBytes(), ObjectUtils.asMap(
                    "resource_type", resourceType,
                    "folder", "syshub_projects"
            ));

            return uploadResult.get("secure_url").toString();

        } catch (IOException e) {
            throw new RuntimeException("Failed to save the file in Cloudinary.", e);
        }
    }

    private String determineResourceType(String contentType, String fileName) {
        if (contentType != null) {
            if(contentType.startsWith("image/")) return "image";
            if(contentType.startsWith("video/")) return "video";
        }

        if(fileName != null) {
            String lower = fileName.toLowerCase();
            if(lower.endsWith(".jpg") || lower.endsWith(".jpeg") || lower.endsWith(".png") || lower.endsWith(".gif") || lower.endsWith(".webp") || lower.endsWith(".svg")) return "image";
            if(lower.endsWith(".mp4") || lower.endsWith("move")) return "video";
        }
        return "raw";
    }

    private String extractPublicId(String url) {
        String[] parts = url.split("/");
        String lastPart = parts[parts.length - 1];
        String folder = parts[parts.length - 2];
        return folder + "/" + lastPart;
    }
}