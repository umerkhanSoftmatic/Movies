
import SwiftUI

@main
struct MoviesApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MoviesAppView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
