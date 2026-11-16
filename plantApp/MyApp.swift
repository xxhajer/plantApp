import SwiftUI
import SwiftData
@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            StartYourPlantJourney()
                .modelContainer(for: Plant.self)
        }
    }
}
