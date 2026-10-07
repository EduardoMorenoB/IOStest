import ActivityKit
import SwiftUI

@main
struct IOStestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var message = "Hello World"
    @State private var activity: Activity<HelloAttributes>?

    var body: some View {
        VStack(spacing: 20) {
            Text("Hello World")
                .font(.largeTitle.bold())

            Button(activity == nil ? "Show on Dynamic Island" : "Update Live Activity") {
                Task { await startOrUpdateActivity() }
            }
            .buttonStyle(.borderedProminent)

            if activity != nil {
                Button("End Live Activity", role: .destructive) {
                    Task { await endActivity() }
                }
                .buttonStyle(.bordered)
            }

            Text("Live Activities require a supported iPhone and are not available in the Simulator's Dynamic Island.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(28)
        .task { activity = Activity<HelloAttributes>.activities.first }
    }

    @MainActor
    private func startOrUpdateActivity() async {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        if let activity {
            await activity.update(.init(state: .init(message: message), staleDate: nil))
            return
        }
        do {
            activity = try Activity.request(
                attributes: HelloAttributes(),
                content: .init(state: .init(message: message), staleDate: nil),
                pushType: nil
            )
        } catch {
            print("Could not start Live Activity: \(error)")
        }
    }

    @MainActor
    private func endActivity() async {
        await activity?.end(nil, dismissalPolicy: .immediate)
        activity = nil
    }
}
