package com.syshub.core.storage;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.Resource;
import java.nio.file.Path;
import java.util.stream.Stream;

public interface IStorageService {
    String store(MultipartFile file);
}