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
    public void init() {
        System.out.println("Almacenamiento en Cloudinary inicializado.");
    }

    @Override
    public String store(MultipartFile file) {
        try {
            if (file.isEmpty()) {
                throw new RuntimeException("Fallo al guardar un archivo vacío.");
            }

            Map uploadResult = cloudinary.uploader().upload(file.getBytes(), ObjectUtils.asMap(
                    "resource_type", "auto",
                    "folder", "syshub_projects" // Organiza todo en una carpeta en tu Cloudinary
            ));

            return uploadResult.get("secure_url").toString();

        } catch (IOException e) {
            throw new RuntimeException("Fallo al almacenar el archivo en Cloudinary.", e);
        }
    }

    @Override
    public Path load(String filename) {
        throw new UnsupportedOperationException("Carga por Path no está soportada en Cloudinary.");
    }

    @Override
    public Resource loadAsResource(String filename) {
        try {
            Resource resource = new UrlResource(filename);
            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new RuntimeException("No se pudo leer el archivo de la URL: " + filename);
            }
        } catch (MalformedURLException e) {
            throw new RuntimeException("Error en URL del archivo: " + filename, e);
        }
    }

    @Override
    public void delete(String filename) {
        try {
            String publicId = extractPublicId(filename);
            cloudinary.uploader().destroy(publicId, ObjectUtils.asMap("resource_type", "raw"));
            cloudinary.uploader().destroy(publicId, ObjectUtils.asMap("resource_type", "image"));
        } catch (IOException e) {
            throw new RuntimeException("Error al borrar el archivo en Cloudinary", e);
        }
    }

    private String extractPublicId(String url) {
        String[] parts = url.split("/");
        String lastPart = parts[parts.length - 1];
        String folder = parts[parts.length - 2];

        int dotIndex = lastPart.lastIndexOf('.');
        String nameWithoutExtension = (dotIndex == -1) ? lastPart : lastPart.substring(0, dotIndex);

        return folder + "/" + nameWithoutExtension;
    }
}