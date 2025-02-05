package com.mongle.api.repository;

import com.mongle.api.domain.Hashtag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface HashtagRepository extends JpaRepository<Hashtag, Integer> {
    Optional<Hashtag> findByTag(String hashtagName);
}
