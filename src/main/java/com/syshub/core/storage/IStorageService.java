package com.syshub.core.storage;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.Resource;
import java.nio.file.Path;
import java.util.stream.Stream;

public interface IStorageService {
    void init();
    String store(MultipartFile file);
    Path load(String filename);
    Resource loadAsResource(String filename);
    void delete(String filename);
}