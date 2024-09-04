import Foundation

class MoviesViewModel: ObservableObject {
    
    @Published var movies: [Result] = []
    @Published var recentlyViewedMovies: [Result] = []
    private var currentPage: Int = 1
    
    init() {
        Task {
            await fetchMovies()
        }
    }
    
    func fetchMovies() async {
        do {
            let movies = try await Services.shared.fetchMovies(page: currentPage)
                self.movies = movies.results ?? []
               // self.currentPage += 1
            
        } catch(let error) {
            print("Error fetching movies: \(error.localizedDescription)")
        }
    }
    
    
    
    func searchMovies(query: String) async {
        if query.isEmpty {
            await fetchMovies()
        } else {
            do {
                let movies = try await Services.shared.searchMovies(query: query)
                    self.movies = movies.results ?? []
            } catch(let error) {
                print("Error searching movies: \(error.localizedDescription)")
            }
        }
    }
    


}
