import SwiftUI
import SwiftData

@main
struct MyApp: App {
    @AppStorage("isFirstTime") var isFirstTime: Bool = true
    @State private var showStart: Bool = true

    var body: some Scene {
        WindowGroup {
            Group {
                if showStart {
                    StartYourPlantJourney()
                } else {
                    NoReminders()
                }
            }
            .onAppear {
                NotificationService().requestPermission()
                showStart = isFirstTime
                isFirstTime = false
            }
        }
        .modelContainer(for: Plant.self)
    }
}
