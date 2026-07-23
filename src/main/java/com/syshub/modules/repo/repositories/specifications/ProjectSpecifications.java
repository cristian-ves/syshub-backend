package com.syshub.modules.repo.repositories.specifications;

import com.syshub.modules.repo.entities.Project;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ProjectSpecifications {

    public static Specification<Project> filterProjects(
            String tag,
            Boolean featured,
            String courseName,
            Integer semesterNum,
            UUID userId,
            Integer studyPlanId,
            Integer areaId,
            String search
    ) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (search != null && !search.isEmpty()) {
                String pattern = "%" + search.toLowerCase() + "%";
                Predicate titleP = cb.like(cb.lower(root.get("title")), pattern);
                Predicate descP = cb.like(cb.lower(root.get("description")), pattern);
                predicates.add(cb.or(titleP, descP));
            }

            if (tag != null && !tag.isEmpty()) {
                Join<Object, Object> tagsJoin = root.join("tags");
                predicates.add(cb.like(cb.lower(tagsJoin.get("name")), "%" + tag.toLowerCase() + "%"));
            }

            if (courseName != null && !courseName.isEmpty()) {
                predicates.add(cb.like(cb.lower(root.get("course").get("name")), "%" + courseName.toLowerCase() + "%"));
            }

            if (featured != null) predicates.add(cb.equal(root.get("featured"), featured));
            if (semesterNum != null) predicates.add(cb.equal(root.get("course").get("semester").get("number"), semesterNum));
            if (userId != null) predicates.add(cb.equal(root.get("author").get("id"), userId));
            if (areaId != null) predicates.add(cb.equal(root.get("course").get("area").get("id"), areaId));

            if (studyPlanId != null) {
                predicates.add(cb.equal(root.get("course").get("semester").get("studyPlan").get("id"), studyPlanId));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}