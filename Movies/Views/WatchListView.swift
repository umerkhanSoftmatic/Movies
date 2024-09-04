import SwiftUI

struct WatchListView: View {
    @StateObject var watchListViewModel: WatchListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Watch List")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(watchListViewModel.watchList, id: \.id) { movie in
                    HStack(alignment: .top) {
                        if let posterPath = movie.poster_path {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w92\(posterPath)")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 120)
                            .cornerRadius(10)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text(movie.original_title ?? "")
                                .font(.title2)
                                .fontWeight(.bold)
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                Text("\(movie.vote_average ?? 0, specifier: "%.1f")")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                            Text("Action")
                                .font(.subheadline)
                            Text("\(movie.release_date?.prefix(4) ?? "")")
                                .font(.subheadline)
                            Text("150 minutes")
                                .font(.subheadline)
                        }
                    }

                }
            }
        }
    }
}

#Preview {
    WatchListView(watchListViewModel: WatchListViewModel())
}
