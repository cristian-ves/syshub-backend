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
            Boolean destacado,
            Long cursoId,
            Integer semestreNum,
            UUID userId,
            Long pensumId) {

        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (tag != null) {
                Join<Object, Object> tagsJoin = root.join("tags");
                predicates.add(cb.equal(tagsJoin.get("nombre"), tag));
            }

            if (destacado != null) {
                predicates.add(cb.equal(root.get("destacado"), destacado));
            }

            if (cursoId != null) {
                predicates.add(cb.equal(root.get("curso").get("id"), cursoId));
            }

            if (semestreNum != null) {
                predicates.add(cb.equal(root.get("curso").get("semester").get("numero"), semestreNum));
            }

            if (userId != null) {
                predicates.add(cb.equal(root.get("autor").get("id"), userId));
            }

            if (pensumId != null) {
                // Project -> Course -> Semester -> Pensum
                predicates.add(cb.equal(root.get("curso").get("semester").get("pensum").get("id"), pensumId));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}