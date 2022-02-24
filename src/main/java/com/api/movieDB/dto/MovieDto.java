package com.api.movieDB.dto;

import lombok.Getter;


@Getter
public class MovieDto {

    private String title;
    private String duration;
    private String genre;
    private String synopsis;
    private Integer year;

    public String getTitle() {
        return title;
    }

    public String getDuration() {
        return duration;
    }

    public String getGenre() {
        return genre;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public Integer getYear() {
        return year;
    }
}
