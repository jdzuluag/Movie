package com.api.movieDB.entity;

import javax.persistence.*;

@Table(name = "movie")
@Entity
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "title", nullable = false, length = 45)
    private String title;

    @Column(name = "duration", nullable = false, length = 45)
    private String duration;

    @Column(name = "genre", nullable = false, length = 45)
    private String genre;

    @Column(name = "synopsis", nullable = false, length = 200)
    private String synopsis;

    @Column(name = "year", nullable = false)
    private Integer year;
    
    public Movie() {
    }

    public Movie(String title, String duration, String genre, String synopsis, Integer year) {
        this.title = title;
        this.duration = duration;
        this.genre = genre;
        this.synopsis = synopsis;
        this.year = year;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getId() {
        return id;
    }
}