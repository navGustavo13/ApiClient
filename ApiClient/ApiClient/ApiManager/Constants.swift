//
//  Constants.swift
//  ApiClient
//
//  Created by Gustavo Navarro on 25/06/22.
//

import Foundation

struct  Constants {
    static let appiKey = "429bd6eb3ae6496210731b951f6d6f95"
    static let urlApiMovies = "https://api.themoviedb.org"
    static let moviePath = "/3/movie/popular"
    static let genrePath  = "/3/genre/movie/list"
    static let genresURL = "https://api.themoviedb.org/3/genre/movie/list?api_key=" + appiKey + "&language=en-US"
    static let moviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=" + appiKey + "&language=en-US&page=1"
}
