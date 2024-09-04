import SwiftUI

struct NowPlayingView: View {
    @ObservedObject var viewModel: MoviesViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 60) {
                ForEach(Array(viewModel.movies.enumerated()), id: \.element.id) { index, movie in
                    if let posterPath = movie.poster_path {
                        NavigationLink(destination: DetailView(movie: movie)) {
                            ZStack(alignment: .bottomLeading) {
                                GeometryReader { geometry in
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w92\(posterPath)")) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                            .cornerRadius(30)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                .frame(width: 240, height: 320)
                                
                                Text("\(index + 1)")
                                    .font(.system(size: 150))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .padding([.bottom, .leading], -40)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}
