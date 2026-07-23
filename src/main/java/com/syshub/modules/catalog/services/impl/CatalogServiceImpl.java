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

    private final StudyPlanRepository studyPlanRepository;
    private final SemesterRepository semesterRepository;
    private final CourseRepository courseRepository;
    private final TagRepository tagRepository;
    private final TechnicalAreaRepository areaRepository;
    private final CatalogMapper catalogMapper;

    @Override
    public List<StudyPlan> getAllStudyPlans() {
        return studyPlanRepository.findAll();
    }

    @Override
    public List<Semester> getSemestersByStudyPlan(Integer studyPlanId) {
        return semesterRepository.findByStudyPlanIdOrderByNumberAsc(studyPlanId);
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
    public List<CourseResponseDTO> getCoursesBySemester(Integer semesterNum) {
        return courseRepository.findBySemesterNumber(semesterNum).stream()
                .map(catalogMapper::toCourseDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<CourseResponseDTO> searchCourses(String query) {
        return courseRepository.findByNameContainingIgnoreCaseOrCodeContainingIgnoreCase(query, query)
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