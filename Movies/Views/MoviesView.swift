import SwiftUI

struct MoviesView: View {
    @StateObject private var viewModel = MoviesViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("What do you want to watch?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // Search bar to search movies
                SearchBarView(searchText: $searchText)
                    .onChange(of: searchText) { newValue in
                        Task {
                            await viewModel.searchMovies(query: newValue)
                        }
                    }
                
                // Now Playing Section
                if !viewModel.movies.isEmpty {
                    Text("Now Playing")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    NowPlayingView(viewModel: viewModel)
                }
                
                // Upcoming Section
                if !viewModel.movies.isEmpty {
                    Text("Upcoming")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    UpcomingView(viewModel: viewModel)
                }
                
                // Repeat Section (Assuming you want to repeat the upcoming section)
                if !viewModel.movies.isEmpty {
                    Text("Repeat")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    UpcomingView(viewModel: viewModel)
                }
                
            }
            .background(Color(.gray).opacity(0.2))
            .ignoresSafeArea(edges: .bottom)
            
            .onAppear {
                Task {
                    await viewModel.fetchMovies()
                }
            }
            
        }
    }
}

#Preview {
    MoviesView()
}
