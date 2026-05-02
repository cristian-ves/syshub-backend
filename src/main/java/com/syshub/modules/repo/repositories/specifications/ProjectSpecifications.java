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
            String cursoNombre,
            Integer semestreNum,
            UUID userId,
            Integer pensumId,
            Integer areaId,
            String search
    ) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (search != null && !search.isEmpty()) {
                String pattern = "%" + search.toLowerCase() + "%";
                Predicate titleP = cb.like(cb.lower(root.get("titulo")), pattern);
                Predicate descP = cb.like(cb.lower(root.get("descripcion")), pattern);
                predicates.add(cb.or(titleP, descP));
            }

            if (tag != null && !tag.isEmpty()) {
                Join<Object, Object> tagsJoin = root.join("tags");
                predicates.add(cb.like(cb.lower(tagsJoin.get("nombre")), "%" + tag.toLowerCase() + "%"));
            }

            if (cursoNombre != null && !cursoNombre.isEmpty()) {
                predicates.add(cb.like(cb.lower(root.get("curso").get("nombre")), "%" + cursoNombre.toLowerCase() + "%"));
            }

            if (destacado != null) predicates.add(cb.equal(root.get("destacado"), destacado));
            if (semestreNum != null) predicates.add(cb.equal(root.get("curso").get("semester").get("numero"), semestreNum));
            if (userId != null) predicates.add(cb.equal(root.get("autor").get("id"), userId));
            if (areaId != null) predicates.add(cb.equal(root.get("curso").get("area").get("id"), areaId));

            if (pensumId != null) {
                predicates.add(cb.equal(root.get("curso").get("semester").get("pensum").get("id"), pensumId));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}