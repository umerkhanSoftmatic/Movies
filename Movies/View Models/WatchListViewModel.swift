import SwiftUI

class WatchListViewModel: ObservableObject {
    @Published var watchList: [Result] = []
    private var currentPage: Int = 1
    
 
    init() {
        Task {
            await fetchMovies()
        }
    }
    func fetchMovies() async {
        do {
            let movies = try await Services.shared.fetchMovies(page: currentPage)
            self.watchList = movies.results ?? []
            // self.currentPage += 1
        } catch(let error) {
            print("Error fetching movies: \(error.localizedDescription)")
        }
    }
    
}
