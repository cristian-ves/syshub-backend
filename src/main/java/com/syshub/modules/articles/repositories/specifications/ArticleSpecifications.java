package com.syshub.modules.articles.repositories.specifications;

import com.syshub.modules.articles.entities.Article;
import jakarta.persistence.criteria.Join;
import org.springframework.data.jpa.domain.Specification;
import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.criteria.Predicate;

public class ArticleSpecifications {

    public static Specification<Article> filterArticles(String search, Long courseId, String tag, String status) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (search != null && !search.isEmpty()) {
                String likeSearch = "%" + search.toLowerCase() + "%";
                predicates.add(cb.or(
                        cb.like(cb.lower(root.get("titulo")), likeSearch),
                        cb.like(cb.lower(root.get("extracto")), likeSearch)
                ));
            }

            if (courseId != null) {
                predicates.add(cb.equal(root.get("curso").get("id"), courseId));
            }

            if (tag != null && !tag.trim().isEmpty()) {

                Join<Object, Object> tagsJoin = root.join("tags");

                String searchPattern = "%" + tag.toLowerCase().trim() + "%";

                predicates.add(cb.like(cb.lower(tagsJoin.get("nombre")), searchPattern));
            }

            if (status != null) {
                predicates.add(cb.equal(root.get("status"), Article.ArticleStatus.valueOf(status)));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}