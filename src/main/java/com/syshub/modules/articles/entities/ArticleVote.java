package com.syshub.modules.articles.entities;

import com.syshub.modules.identity.entities.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "votos")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ArticleVote {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_id")
    private Article articulo;

    @Column(nullable = false)
    private Integer valor; // 1 o -1

    @Column(name = "target_type", nullable = false)
    private String targetType = "ARTICULO";
}