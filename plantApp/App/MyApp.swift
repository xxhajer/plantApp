import SwiftUI
import SwiftData

@main
struct MyApp: App {
    @AppStorage("isFirstTime") var isFirstTime: Bool = true
    @State private var showStart: Bool

    init() {
        let firstTime = UserDefaults.standard.object(forKey: "isFirstTime") as? Bool ?? true
        _showStart = State(initialValue: firstTime)
    }

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
                isFirstTime = false
            }
        }
        .modelContainer(for: Plant.self)
    }
}
