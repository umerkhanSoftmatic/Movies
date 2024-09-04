import SwiftUI

struct UpcomingView: View {
    
    @ObservedObject var viewModel : MoviesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.movies, id: \.id) { movie in
                    if let posterPath = movie.poster_path {
                    
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w92\(posterPath)")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 160, height: 220)
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
}
