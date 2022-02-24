package com.api.movieDB.repository;
import com.api.movieDB.entity.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface MovieRepository extends JpaRepository<Movie,Long> {
    
    Optional<Movie>findByTitle(String title);
    List<Movie> findAllByGenre(String genre);
    boolean existsByTitle(String title);

}