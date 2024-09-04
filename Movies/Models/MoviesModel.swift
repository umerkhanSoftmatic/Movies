// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movies = try? JSONDecoder().decode(MoviesModel.self, from: jsonData)

import Foundation

// MARK: - MoviesModel
struct MoviesModel: Codable , Hashable{
    var page: Int?
    var results: [Result]?
    var totalPages, totalResults: Int?
}

// MARK: - Result
struct Result: Codable , Hashable{
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title, overview: String?
    var popularity: Double?
    var poster_path, release_date, title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}


