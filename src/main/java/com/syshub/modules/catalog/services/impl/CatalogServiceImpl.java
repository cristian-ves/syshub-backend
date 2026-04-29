package com.syshub.modules.catalog.services.impl;

import com.syshub.modules.catalog.dtos.CourseResponseDTO;
import com.syshub.modules.catalog.dtos.TagResponseDTO;
import com.syshub.modules.catalog.entities.*;
import com.syshub.modules.catalog.mappers.CatalogMapper;
import com.syshub.modules.catalog.repositories.*;
import com.syshub.modules.catalog.services.ICatalogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CatalogServiceImpl implements ICatalogService {

    private final PensumRepository pensumRepository;
    private final SemesterRepository semesterRepository;
    private final CourseRepository courseRepository;
    private final TagRepository tagRepository;
    private final TechnicalAreaRepository areaRepository;
    private final CatalogMapper catalogMapper;

    @Override
    public List<Pensum> getAllPensums() {
        return pensumRepository.findAll();
    }

    @Override
    public List<Semester> getSemestersByPensum(Long pensumId) {
        return semesterRepository.findByPensumIdOrderByNumeroAsc(pensumId);
    }

    @Override
    public List<TechnicalArea> getAllAreas() {
        return areaRepository.findAll();
    }

    @Override
    public List<TagResponseDTO> getAllTags() {
        return tagRepository.findAll().stream()
                .map(catalogMapper::toTagDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CourseResponseDTO> getCoursesBySemester(Long semesterId) {
        return courseRepository.findBySemesterId(semesterId).stream()
                .map(catalogMapper::toCourseDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CourseResponseDTO> searchCourses(String query) {
        return courseRepository.findByNombreContainingIgnoreCaseOrCodigoContainingIgnoreCase(query, query)
                .stream()
                .map(catalogMapper::toCourseDTO)
                .collect(Collectors.toList());
    }

    @Override
    public TagResponseDTO saveTag(Tag tag) {
        Tag savedTag = tagRepository.save(tag);
        return catalogMapper.toTagDTO(savedTag);
    }
}