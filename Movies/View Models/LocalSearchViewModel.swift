import Foundation

class LocalSearchViewModel: ObservableObject {
    @Published var recentSearches: [String] = []
    @Published var searchedMovies: [Result] = []
    
    func searchMovies(query: String) async {
        do {
            let movies = try await Services.shared.searchMovies(query: query)
            self.searchedMovies = movies.results ?? []
        } catch(let error) {
            print("Error searching movies: \(error.localizedDescription)")
        }
    }
    
    func addToRecentSearches(query: String) {
        recentSearches.insert(query, at: 0)
        if recentSearches.count > 10 {
            recentSearches.removeLast()
        }
    }
}
