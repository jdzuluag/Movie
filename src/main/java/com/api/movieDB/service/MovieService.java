package com.api.movieDB.service;

import com.api.movieDB.dto.MovieDto;
import com.api.movieDB.entity.Movie;
import com.api.movieDB.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MovieService {

    @Autowired
    MovieRepository movieRepository;

    public ResponseEntity<String> createMovie(MovieDto movieDto){

        if(movieRepository.existsByTitle(movieDto.getTitle())){
            return new ResponseEntity("Ya existe una pelicula con ese nombre", HttpStatus.BAD_REQUEST);
        }else{
            Movie movie= new Movie(movieDto.getTitle(),
                    movieDto.getDuration(),
                    movieDto.getGenre(),
                    movieDto.getSynopsis(),
                    movieDto.getYear());
            movieRepository.save(movie);
            return new ResponseEntity<>("Pelicula creada",HttpStatus.CREATED);
        }

    }

    public ResponseEntity<List<Movie>> listAll(){
        return new ResponseEntity<>(movieRepository.findAll(),HttpStatus.OK);
    }

    public ResponseEntity<String>updateMovie(MovieDto movieDto, Long id){

        Optional<Movie> optionalMovie=movieRepository.findById(id);
        if(optionalMovie.isPresent()){
            Movie movie=optionalMovie.get();
            movie.setTitle(movieDto.getTitle());
            movie.setDuration(movieDto.getDuration());
            movie.setGenre(movieDto.getGenre());
            movie.setSynopsis(movieDto.getSynopsis());
            movie.setYear(movieDto.getYear());
            movieRepository.save(movie);
            return new ResponseEntity<>("Pelicula Actualizada",HttpStatus.OK);
        }else
            return new ResponseEntity<>("No se encontró la pelicula", HttpStatus.NOT_FOUND);

    }

    public ResponseEntity<String>deleteMovie(Long id){
        Optional<Movie> optionalMovie=movieRepository.findById(id);
        if(optionalMovie.isPresent()){
            Movie movie= optionalMovie.get();
            movieRepository.delete(movie);
            return new ResponseEntity<>("Pelicula Eliminada", HttpStatus.OK);
        }else
            return new ResponseEntity("No se encontró la pelicula",HttpStatus.NOT_FOUND);
    }

}
