import Foundation

class Services {
    
    static let shared = Services()
    
    func fetchMovies(page: Int) async throws -> MoviesModel {
        let apiKey = "e5ea3092880f4f3c25fbc537e9b37dc1"
                let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            throw ErrorsHandler.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ErrorsHandler.invalidResponse
        }
        
        guard !data.isEmpty else {
            throw ErrorsHandler.invalidData
        }
        
        let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
        return movies
    }
    

    func searchMovies(query: String) async throws -> MoviesModel {
        let apiKey = "eb185b0e59a9e66aa4efe9ee8e936837"
        let URLString = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(query)&page=1"
        
            
           guard let url = URL(string: URLString) else {
            throw ErrorsHandler.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ErrorsHandler.invalidResponse
        }
        
        guard !data.isEmpty else {
            throw ErrorsHandler.invalidData
        }
        
        let movies = try JSONDecoder().decode(MoviesModel.self, from: data)
        return movies
    }
}


//https://api.themoviedb.org/3/movie/popular?api_key=eb185b0e59a9e66aa4efe9ee8e936837
