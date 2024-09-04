import SwiftUI

struct MoviesAppView: View {
    @State private var selectedIndex: Int = 0
    @StateObject private var viewModel = MoviesViewModel()
    @StateObject private var watchListViewModel = WatchListViewModel()
    
    var body: some View {
        
            TabView(selection: $selectedIndex) {
                
                NavigationView {
                    MoviesView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                        .renderingMode(.template)
                    Text("Home view")
                }
                .tag(0)
                
                NavigationView {
                  LocalSearchView()
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
                
                NavigationView {
                    WatchListView(watchListViewModel: watchListViewModel)
                }
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Watch List")
                }
                .badge("12")
                .tag(2)
            }
        }
    }


#Preview {
    MoviesAppView()
}





//https://image.tmdb.org/t/p/w92/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg




