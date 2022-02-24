package com.api.movieDB.controller;


import com.api.movieDB.dto.MovieDto;
import com.api.movieDB.entity.Movie;
import com.api.movieDB.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/movie")
public class MovieController {

    @Autowired
    MovieService movieService;

    @PostMapping()
    public ResponseEntity<String>createMovie(@RequestBody MovieDto movieDto){
        return movieService.createMovie(movieDto);
    }
    @GetMapping
    public ResponseEntity<List<Movie>>listMovies(){
        return movieService.listAll();
    }
    @PutMapping("/{id}")
    public ResponseEntity<String>updateMovie(@PathVariable("id") Long id, @RequestBody MovieDto movieDto){
        return movieService.updateMovie(movieDto,id);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<String>deleteMovie(@PathVariable("id")Long id){
        return movieService.deleteMovie(id);
    }

}