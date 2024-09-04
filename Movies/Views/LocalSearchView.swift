import SwiftUI

struct LocalSearchView: View {
    @StateObject private var viewModel = LocalSearchViewModel()
    @State private var searchText: String = ""
    @State private var selectedMovie: Result?
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $searchText)
                    .onChange(of: searchText) { newValue in
                        Task {
                            await viewModel.searchMovies(query: newValue)
                        }
                    }
                
                List {
                        ForEach(viewModel.recentSearches, id: \.self) { search in
                            Text(search)
                                .onTapGesture {
                                    searchText = search
                                    Task {
                                        await viewModel.searchMovies(query: search)
                                    }
                                }
                        }

                        
                        ForEach(viewModel.searchedMovies, id: \.id) { movie in
                            NavigationLink(
                                destination: DetailView(movie: movie), tag: movie,
                                selection: $selectedMovie
                            )
                            {
                                Text(movie.original_title ?? "Unknown Title")
                            }
                            
                            .onTapGesture {
                                viewModel.addToRecentSearches(query: movie.original_title ?? "No title")
                               selectedMovie = movie
                                
                            }
                        }
                    }
                }
                .padding(.top)
//                 .onDisappear {
//                     searchText = ""
//                 }
            }
            .navigationTitle("Search Movies")

        }
    }


#Preview {
    LocalSearchView()
}
