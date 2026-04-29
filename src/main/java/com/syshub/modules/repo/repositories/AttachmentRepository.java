package com.syshub.modules.repo.repositories;

import com.syshub.modules.repo.entities.Attachment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AttachmentRepository extends JpaRepository<Attachment, Long> {
}